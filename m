From: Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Mon, 3 Jun 2019 10:52:47 -0500
Message-ID: <87f98f81-8f77-3bc5-374c-f498e07cb1bd@linaro.org>
References: <20190531035348.7194-1-elder@linaro.org>
 <e75cd1c111233fdc05f47017046a6b0f0c97673a.camel@redhat.com>
 <065c95a8-7b17-495d-f225-36c46faccdd7@linaro.org>
 <CAK8P3a05CevRBV3ym+pnKmxv+A0_T+AtURW2L4doPAFzu3QcJw@mail.gmail.com>
 <a28c5e13-59bc-144d-4153-9d104cfa9188@linaro.org>
 <3b1e12b145a273dd3ded2864d976bdc5fa90e68a.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <3b1e12b145a273dd3ded2864d976bdc5fa90e68a.camel@redhat.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Dan Williams <dcbw@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Cc: David Miller <davem@davemloft.net>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, evgreen@chromium.org, Ben Chan <benchan@google.com>, Eric Caruso <ejcaruso@google.com>, cpratapa@codeaurora.org, syadagir@codeaurora.org, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, abhishek.esse@gmail.com, Networking <netdev@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 6/3/19 9:54 AM, Dan Williams wrote:
>> To be perfectly honest, at first I thought having IPA use rmnet
>> was a cargo cult thing like Dan suggested, because I didn't see
> To be clear I only meant cargo-culting the naming, not any
> functionality. Clearly IPA/rmnet/QMAP are pretty intimately connected
> at this point. But this goes back to whether IPA needs a netdev itself
> or whether you need an rmnet device created on top. If the former then
> I'd say no cargo-culting, if the later then it's a moot point because
> the device name will be rmnet%d anyway.

OK I thought you weren't sure why rmnet was a layer at all.  As I
said, I didn't have a very good understanding of why it was even
needed when I first started working on this.

I can't (or won't) comment right now on whether IPA needs its own
netdev for rmnet to use.  The IPA endpoints used for the modem
network interfaces are enabled when the netdev is opened and
disabled when closed.  Outside of that, TX and RX are pretty
much immediately passed through to the layer below or above.
IPA currently has no other net device operations.

					-Alex
