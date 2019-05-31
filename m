From: Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Fri, 31 May 2019 17:08:40 -0500
Message-ID: <5ebccdbe-479d-2b7d-693c-0c412060d687@linaro.org>
References: <20190531035348.7194-1-elder@linaro.org>
 <e75cd1c111233fdc05f47017046a6b0f0c97673a.camel@redhat.com>
 <065c95a8-7b17-495d-f225-36c46faccdd7@linaro.org>
 <CAK8P3a05CevRBV3ym+pnKmxv+A0_T+AtURW2L4doPAFzu3QcJw@mail.gmail.com>
 <a28c5e13-59bc-144d-4153-9d104cfa9188@linaro.org>
 <CAK8P3a2rkQd3t-yNdNGePW8E7rhObjAvUpW6Ga9AM6rJJ27BOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a2rkQd3t-yNdNGePW8E7rhObjAvUpW6Ga9AM6rJJ27BOw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dan Williams <dcbw@redhat.com>, David Miller <davem@davemloft.net>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, evgreen@chromium.org, Ben Chan <benchan@google.com>, Eric Caruso <ejcaruso@google.com>, cpratapa@codeaurora.org, syadagir@codeaurora.org, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, abhishek.esse@gmail.com, Networking <netdev@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 5/31/19 4:12 PM, Arnd Bergmann wrote:
> On Fri, May 31, 2019 at 10:47 PM Alex Elder <elder@linaro.org> wrote:
>> On 5/31/19 2:19 PM, Arnd Bergmann wrote:
>>> On Fri, May 31, 2019 at 6:36 PM Alex Elder <elder@linaro.org> wrote:
>>>> On 5/31/19 9:58 AM, Dan Williams wrote:
>>>>> On Thu, 2019-05-30 at 22:53 -0500, Alex Elder wrote:
>>>
>>> Does this mean that IPA can only be used to back rmnet, and rmnet
>>> can only be used on top of IPA, or can or both of them be combined
>>> with another driver to talk to instead?
>>
>> No it does not mean that.
>>
>> As I understand it, one reason for the rmnet layer was to abstract
>> the back end, which would allow using a modem, or using something
>> else (a LAN?), without exposing certain details of the hardware.
>> (Perhaps to support multiplexing, etc. without duplicating that
>> logic in two "back-end" drivers?)
>>
>> To be perfectly honest, at first I thought having IPA use rmnet
>> was a cargo cult thing like Dan suggested, because I didn't see
>> the benefit.  I now see why one would use that pass-through layer
>> to handle the QMAP features.
>>
>> But back to your question.  The other thing is that I see no
>> reason the IPA couldn't present a "normal" (non QMAP) interface
>> for a modem.  It's something I'd really like to be able to do,
>> but I can't do it without having the modem firmware change its
>> configuration for these endpoints.  My access to the people who
>> implement the modem firmware has been very limited (something
>> I hope to improve), and unless and until I can get corresponding
>> changes on the modem side to implement connections that don't
>> use QMAP, I can't implement such a thing.
> 
> Why would that require firmware changes? What I was thinking
> here is to turn the bits of the rmnet driver that actually do anything
> interesting on the headers into a library module (or a header file
> with inline functions) that can be called directly by the ipa driver,
> keeping the protocol unchanged.

You know, it's possible you're right about not needing
firmware changes.  But it has always been my impression
they would be needed.  Here's why.

It looks like this:

           GSI Channel   GSI Channel
               |             |         
  ----------   v   -------   v   -------------
  | AP (ep)|=======| IPA |=======|(ep) Modem |
  ----------       -------       -------------

The AP and Modem each have IPA endpoints (ep), which use GSI channels,
to communicate with the IPA. Each endpoint has configuration options
(such as checksum offload).  I *thought* that the configurations of
the two endpoints need to be compatible (e.g., they need to agree on
whether they're aggregating).  But with your questioning I now think
you may be right, that only the local endpoint's configuration matters.

I will inquire further on this.  I *know* that the AP and modem
exchange some information about IPA configuration, but looking more
closely that looks like it's all about the configuration of shared
IPA resources, not endpoints.

That said, the broader design (including the user space code)
surely assumes rmnet, and I don't have any sense of what impact
changing that would make.  I am sure that changing it would not
be well received.

					-Alex

>>> Always passing data from one netdev to another both ways
>>> sounds like it introduces both direct CPU overhead, and
>>> problems with flow control when data gets buffered inbetween.
>>
>> My impression is the rmnet driver is a pretty thin layer,
>> so the CPU overhead is probably not that great (though
>> deaggregating a message is expensive).  I agree with you
>> on the flow control.
> 
> The CPU overhead I mean is not from executing code in the
> rmnet driver, but from passing packets through the network
> stack between the two drivers, i.e. adding each frame to
> a queue and taking it back out. I'm not sure how this ends
> up working in reality but from a first look it seems like
> we might bounce in an out of the softirq handler inbetween.
> 
>           Arnd
> 
