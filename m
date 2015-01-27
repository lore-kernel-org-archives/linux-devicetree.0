From: Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add dts file for pcDuino 3
 Nano board
Date: Tue, 27 Jan 2015 18:25:33 +0000
Message-ID: <20150127182533.GE871@cartman.at.offog.org>
References: <1422199921-325-1-git-send-email-ats@offog.org>
 <20150125164846.GL8470@lukather>
 <20150126003520.GA871@cartman.at.offog.org>
 <20150126100921.GQ8470@lukather>
 <20150126135931.GB871@cartman.at.offog.org>
 <20150127170035.GJ7200@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCQPXGGUXQGBBJ5QT6TAKGQEEHCRVZA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150127170035.GJ7200@lukather>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 27, 2015 at 06:00:35PM +0100, Maxime Ripard wrote:
> > How about pcduino3-nano:green:usr-led3/4? Or ...:usr1/2, and a comment
> > in the .dts explaining how they're labelled on the board?
> The latter looks better yes. tx and rx would do too, if you know what
> tx and what rx we're talking about here.

I've changed it to usr1/2 with comments. (I don't know if they were
intended to be TX/RX; the documentation doesn't suggest so.)

> > They're multipurpose pins on Arduino-compatible headers:
...
> > So should we [...]
> None of the above, if there's no hardware default, we won't enforce
> any default either. This is a case for the DT overlays.

OK -- that simplifies it quite a bit, then. v3 of the patch incoming!

Thanks very much,

-- 
Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>                         <http://offog.org/>
