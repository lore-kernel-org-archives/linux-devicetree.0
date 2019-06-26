From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: WWAN Controller Framework (was IPA [PATCH v2 00/17])
Date: Wed, 26 Jun 2019 19:58:56 +0200
Message-ID: <24bc6695f664669fc77778b7aba5a0f1c88ac85d.camel@sipsolutions.net>
References: <20190531035348.7194-1-elder@linaro.org>
         <23ff4cce-1fee-98ab-3608-1fd09c2d97f1@linaro.org>
         <6dae9d1c-ceae-7e88-fe61-f4cda82820ea@linaro.org>
         <f1243295f088b70d48e4b832a28f79c0cd84ca1c.camel@sipsolutions.net>
         <25bb0936-686c-101b-c5a4-474ed37536aa@linaro.org>
         (sfid-20190626_154015_130082_AEA49FB2)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <25bb0936-686c-101b-c5a4-474ed37536aa@linaro.org> (sfid-20190626_154015_130082_AEA49FB2)
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Elder <elder@linaro.org>, davem@davemloft.net, arnd@arndb.de, bjorn.andersson@linaro.org, ilias.apalodimas@linaro.org, Dan Williams <dcbw@redhat.com>
Cc: evgreen@chromium.org, benchan@google.com, ejcaruso@google.com, cpratapa@codeaurora.org, syadagir@codeaurora.org, subashab@codeaurora.org, abhishek.esse@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2019-06-26 at 08:40 -0500, Alex Elder wrote:

> > I think here we need to be more careful. I don't know how you want to
> > call it, but we actually have multiple levels of control here.
> 
> I completely agree with you.  From what I understand there exists
> a control channel (or even more than one?) that serves a very
> specific purpose in modem management.  The main reason I mention
> the WWAN control function is that someone (maybe you) indicated
> that a control channel automatically gets created.

It may or may not, right. I just bought a cheap used USB modem, and it
just comes with two USB TTY channels, so I guess for data it does PPP on
top of that. But those channels are created automatically once you
connect the device to the system.

OTOH, for something like the Intel modem, we might well decide not to
create *any* channels on driver load, since you have the option of using
AT commands or MBIM (but I believe both at the same time wouldn't really
make sense, if even allowed).

> > This ... depends a bit on how you exactly define a physical channel
> > here. Is that, to you, the PCIe/USB link? In that case, yes, obviously
> > you have only one physical channel for each WWAN unit.
> 
> I think that was what I was trying to capture.  There exists
> one or more "physical" communication paths between the AP
> and WWAN unit/modem.  And while one path *could* carry just
> one type of traffic, it could also carry multiple logical
> channels of traffic by multiplexing.

Right.

(What I wasn't aware is that QMI is actually a different physical path.
I thought it was just a protocol multiplexed on top of the same IPA
physical path).

> I don't think I have any argument with this.  I'm going to try to
> put together something that goes beyond what I wrote in this message,
> to try to capture what I think we agree on in a sort of loose design
> document.

Awesome, thanks a lot!

johannes
