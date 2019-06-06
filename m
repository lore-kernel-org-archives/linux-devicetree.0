From: Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Thu, 6 Jun 2019 12:42:09 -0500
Message-ID: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
References: <20190531035348.7194-1-elder@linaro.org>
 <e75cd1c111233fdc05f47017046a6b0f0c97673a.camel@redhat.com>
 <065c95a8-7b17-495d-f225-36c46faccdd7@linaro.org>
 <CAK8P3a05CevRBV3ym+pnKmxv+A0_T+AtURW2L4doPAFzu3QcJw@mail.gmail.com>
 <a28c5e13-59bc-144d-4153-9d104cfa9188@linaro.org>
 <20190531233306.GB25597@minitux>
 <d76a710d45dd7df3a28afb12fc62cf14@codeaurora.org>
 <CAK8P3a0brT0zyZGNWiS2R0RMHHFF2JG=_ixQyvjhj3Ky39o0UA@mail.gmail.com>
 <040ce9cc-7173-d10a-a82c-5186d2fcd737@linaro.org>
 <CAK8P3a2U=RzfpVaAgRP1QwPhRpZiBNsG5qdWjzwG=tCKZefYHA@mail.gmail.com>
 <b26cf34c0d3fa1a7a700cee935244d7a2a7e1388.camel@redhat.com>
 <CAK8P3a3pQpSpH4q=CL6gr_YzjYgoyD6-eyiLrvnZsqqjpcRxtQ@mail.gmail.com>
 <0264d7f9a35430201a89c068bb13c84c622af11a.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0264d7f9a35430201a89c068bb13c84c622af11a.camel@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dcbw@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Miller <davem@davemloft.net>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, evgreen@chromium.org, Ben Chan <benchan@google.com>, Eric Caruso <ejcaruso@google.com>, cpratapa@codeaurora.org, syadagir@codeaurora.org, abhishek.esse@gmail.com, Networking <netdev@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 6/4/19 4:29 PM, Dan Williams wrote:
> On Tue, 2019-06-04 at 22:04 +0200, Arnd Bergmann wrote:
>> On Tue, Jun 4, 2019 at 5:18 PM Dan Williams <dcbw@redhat.com> wrote:
>>> On Tue, 2019-06-04 at 10:13 +0200, Arnd Bergmann wrote:
>>>> Can you describe what kind of multiplexing is actually going on?
>>>> I'm still unclear about what we actually use multiple logical
>>>> interfaces for here, and how they relate to one another.
>>>
>>> Each logical interface represents a different "connection" (PDP/EPS
>>> context) to the provider network with a distinct IP address and
>>> QoS.
>>> VLANs may be a suitable analogy but here they are L3+QoS.
>>>
>>> In realistic example the main interface (say rmnet0) would be used
>>> for
>>> web browsing and have best-effort QoS. A second interface (say
>>> rmnet1)
>>> would be used for VOIP and have certain QoS guarantees from both
>>> the
>>> modem and the network itself.
>>>
>>> QMAP can also aggregate frames for a given channel
>>> (connection/EPS/PDP
>>> context/rmnet interface/etc) to better support LTE speeds.
>>
>> Thanks, that's a very helpful explanation!
>>
>> Is it correct to say then that the concept of having those separate
>> connections would be required for any proper LTE modem
>> implementation,
>> but the QMAP protocol (and based on that, the rmnet implementation)
>> is Qualcomm specific and shared only among several generations of
>> modems from that one vendor?
> 
> Exactly correct.  This is what Johannes is discussing in his "cellular
> modem APIs - take 2" thread about how this should all be organized at
> the driver level and I think we should figure that out before we commit
> to IPA-with-a-useless-netdev that requires rmnets to be created on top.
> That may end up being the solution but let's have that discussion.

I looked at Johannes' message and the follow-on discussion.  As I've
made clear before, my work on this has been focused on the IPA transport,
and some of this higher-level LTE architecture is new to me.  But it
seems pretty clear that an abstracted WWAN subsystem is a good plan,
because these devices represent a superset of what a "normal" netdev
implements.

HOWEVER I disagree with your suggestion that the IPA code should
not be committed until after that is all sorted out.  In part it's
for selfish reasons, but I think there are legitimate reasons to
commit IPA now *knowing* that it will need to be adapted to fit
into the generic model that gets defined and developed.  Here
are some reasons why.

First, the layer of the IPA code that actually interacts with rmnet
is very small--less than 3% if you simply do a word count of the
source files.  Arnd actually suggested eliminating the "ipa_netdev"
files and merging their content elsewhere.  This suggests two things:
- The interface to rmnet is isolated, so the effect of whatever
  updates are made to support a WWAN (rather than netdev) model will
  be focused
- The vast majority of the driver has nothing to do with that upper
  layer, and deals almost exclusively with managing the IPA hardware.
  The idea of a generic framework isn't minor, but it isn't the
  main focus of the IPA driver either, so I don't think it should
  hold it up.

Second, the IPA code has been out for review recently, and has been
the subject of some detailed discussion in the past few weeks.  Arnd
especially has invested considerable time in review and discussion.
Delaying things until after a better generic model is settled on
(which I'm guessing might be on the order of months) means the IPA
driver will have to be submitted for review again after that, at
which point it will no longer be "fresh"; it'll be a bit like
starting over.

Third, having the code upstream actually means the actual requirements
for rmnet-over-IPA are clear and explicit.  This might not be a huge
deal, but I think it's better to devise a generic WWAN scheme that
can refer to actual code than to do so with assumptions about what
will work with rmnet (and others).  As far as I know, the upstream
rmnet has no other upstream back end; IPA will make it "real."

I support the idea of developing a generic WWAN framework, and I
can assure you I'll be involved enough to perhaps be one of the
first to implement a new generic scheme.

Optimistically, the IPA code itself hasn't seen much feedback
for v2; maybe that means it's in good shape?

Anyway, I'd obviously like to get the IPA code accepted sooner
rather than later, and I think there are good reasons to do that.

					-Alex

>>> You mentioned the need to have a common user space interface
>> for configuration, and if the above is true, I agree that we should
>> try
>> to achieve that, either by ensuring rmnet is generic enough to
>> cover other vendors (and non-QMAP clients), or by creating a
>> new user level interface that IPA/rmnet can be adapted to.
> 
> I would not suggest making rmnet generic; it's pretty QMAP specific
> (but QMAP is spoken by many many modems both SoC, USB stick, and PCIe
> minicard).
> 
> Instead, I think what Johannes is discussing is a better approach. A
> kernel WWAN framework with consistent user API that
> rmnet/IPA/qmi_wwan/MBIM/QMI/serial/Sierra can all implement.
> 
> That wouldn't affect the core packet processing of IPA/rmnet but
> instead:
> 
> 1) when/how an rmnet device actually gets created on top of the IPA (or
> qmi_wwan) device
> 
> AND (one of these two)
> 
> a) whether IPA creates a netdev on probe
> 
> OR
> 
> b) whether there is some "WWAN device" kernel object which userspace
> interacts with create rmnet channels on top of IPA
> 
> Dan
> 
