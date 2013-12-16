From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCHv3,RESEND] rtc: Add support for Intersil ISL12057 I2C RTC
 chip
Date: Mon, 16 Dec 2013 13:24:13 -0800
Message-ID: <20131216212413.GA8369@roeck-us.net>
References: <637f26e051b700ca510a0af695dfd84cf2bfd35d.1387222475.git.arno@natisbad.org>
 <20131216201424.GA6639@roeck-us.net>
 <87r49cpkw2.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87r49cpkw2.fsf@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: Arnaud Ebalard <arno@natisbad.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 16, 2013 at 10:05:01PM +0100, Arnaud Ebalard wrote:
> Hi Guenter,
> 
> Thanks for the fast feedback! I have handled all your comments and
> tested the resulting version on my RN102 w/o problems. Will send a
> v4 in a few minutes.
> 
> Can you just look at first comment below?
> 
> Guenter Roeck <linux@roeck-us.net> writes:
> 
> >> Signed-off-by: Arnaud Ebalard <arno@natisbad.org>
> >> ---
> >> This is a resend - just in case the initial mail slept through - as I
> >> got no feedback over the past week. I have also Cc'ed additional
> >> people.
> >> 
> > Looks like your mailer corrupts the patch. You'll have to fix that.
> 
> If you wonder about the text below the SoB, this is just informational,

I know.

> i.e. to avoid having it in the final commit. Can you be more specific
> if this is not what you meant, i.e. how the patch is otherwise
> corrupted?
> 

I saved the patch and tried to run it through checkpatch. Doing so, I got a lot
of errors with "=3D" or similar, which suggests that the patch went through
Outlook, an Exchange server, or a similar e-mail "beautifier" when it was sent.

If the same happens again, I'll send you a log.

Guenter
