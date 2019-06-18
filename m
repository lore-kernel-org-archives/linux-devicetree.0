From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Tue, 18 Jun 2019 23:02:18 +0200
Message-ID: <6e7f0fb2f85d5062a9e23d37c47d311e10aa4624.camel@sipsolutions.net>
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
 <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
 <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
 <066e9b39f937586f0f922abf801351553ec2ba1d.camel@sipsolutions.net>
 <b3686626-e2d8-bc9c-6dd0-9ebb137715af@linaro.org>
 <b23a83c18055470c5308fcd1eed018056371fc1d.camel@sipsolutions.net>
 <CAK8P3a1FeUQR3pgoQxHoRK05JGORyR+TFATVQiijLWtFKTv6OQ@mail.gmail.com>
 <613cdfde488eb23d7207c7ba6258662702d04840.camel@sipsolutions.net>
 <CAK8P3a2onXpxiE4y9PzRwuPM2dh=h_BKz7Eb0=LLPgBbZoK1bQ@mail.gmail.com>
 (sfid-20190618_225543_624686_3B7D51E7)
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a2onXpxiE4y9PzRwuPM2dh=h_BKz7Eb0=LLPgBbZoK1bQ@mail.gmail.com>
 (sfid-20190618_225543_624686_3B7D51E7)
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: DTML <devicetree@vger.kernel.org>, syadagir@codeaurora.org, Eric Caruso <ejcaruso@google.com>, Dan Williams <dcbw@redhat.com>, linux-arm-msm@vger.kernel.org, abhishek.esse@gmail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, evgreen@chromium.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Alex Elder <elder@linaro.org>, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, Networking <netdev@vger.kernel.org>, linux-soc@vger.kernel.org, David Miller <davem@davemloft.net>, cpratapa@codeaurora.org, Ben Chan <benchan@google.com>
List-Id: devicetree@vger.kernel.org

On Tue, 2019-06-18 at 22:55 +0200, Arnd Bergmann wrote:
> On Tue, Jun 18, 2019 at 10:36 PM Johannes Berg
> <johannes@sipsolutions.net> wrote:
> > 
> > On Tue, 2019-06-18 at 21:59 +0200, Arnd Bergmann wrote:
> > > 
> > > From my understanding, the ioctl interface would create the lower
> > > netdev after talking to the firmware, and then user space would use
> > > the rmnet interface to create a matching upper-level device for that.
> > > This is an artifact of the strong separation of ipa and rmnet in the
> > > code.
> > 
> > Huh. But if rmnet has muxing, and IPA supports that, why would you ever
> > need multiple lower netdevs?
> 
> From my reading of the code, there is always exactly a 1:1 relationship
> between an rmnet netdev an an ipa netdev. rmnet does the encapsulation/
> decapsulation of the qmap data and forwards it to the ipa netdev,
> which then just passes data through between a hardware queue and
> its netdevice.

I'll take your word for it. Seems very odd, given that the whole point
of the QMAP header seems to be ... muxing?

> [side note: on top of that, rmnet also does "aggregation", which may
>  be a confusing term that only means transferring multiple frames
>  at once]

Right, but it's not all that much interesting in the context of this
discussion.

> Sure, I definitely understand what you mean, and I agree that would
> be the right way to do it. All I said is that this is not how it was done
> in rmnet (this was again my main concern about the rmnet design
> after I learned it was required for ipa) ;-)

:-)

Well, I guess though if the firmware wants us to listen to those on/off
messages we'll have to do that one way or the other.

Oh. Maybe it's just *because* rmnet is layered on top, and thus you
fundamentally cannot do flow control the way I described - not because
you have multiple session on the same hardware ring, but because you
abstracted the hardware ring away too much ...


johannes
