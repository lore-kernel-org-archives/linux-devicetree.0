From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [REGRESSION] "console: don't prefer first registered if DT specifies stdout-path" breaks console on video outputs of various ARM boards
Date: Fri, 4 Nov 2016 12:30:35 +0000
Message-ID: <17833033.PtOSTzKXGD@np-p-burton>
References: <20161104121135.4780-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart10734688.zpdo6DTjzD";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161104121135.4780-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Thorsten Leemhuis <regressions@leemhuis.info>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--nextPart10734688.zpdo6DTjzD
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Hans,

On Friday, 4 November 2016 13:11:34 GMT Hans de Goede wrote:
> Hi All,
> 
> While booting 4.9-rc# for the first time on an Allwinner A33 tablet,
> I noticed that after u-boot the LCD display stayed black. It turns out
> that there was an issue which caused X to never get up, and all kernel
> (and other startup) messages prior to that only went to ttyS0 which
> consists of 2 tiny testpads on the PCB with this tablet.
> 
> The same issue will also happen on any ARM boards which have a HDMI or
> composite video output and which use a stdout-path pointing to their
> serial console. I think this will e.g. also impact the Raspberry Pi,
> I know for certain that this will impact the 99 different Allwinnner
> boards currently supported by mainline u-boot + the mainline kernel.
> 
> This is a behavior changes from previous kernels and I consider this
> a regression. Thus I propose to revert the commit in question, for more
> info here is a partial copy of the commit message of the proposed revert:
> 
> The reverted commit changes existing behavior on which many ARM boards
> rely. Many ARM small-board-computers, like e.g. the Raspberry Pi have
> both a video output and a serial console. Depending on whether the user
> is using the device as a more regular computer; or as a headless device
> we need to have the console on either one or the other.
> 
> Many users rely on the kernel behavior of the console being present on
> both outputs, before the reverted commit the console setup with no
> console= kernel arguments on an ARM board which sets stdout-path in dt
> would look like this:
> 
> [root@localhost ~]# cat /proc/consoles
> ttyS0                -W- (EC p a)    4:64
> tty0                 -WU (E  p  )    4:1
> 
> Where as after the reverted commit, it looks like this:
> 
> [root@localhost ~]# cat /proc/consoles
> ttyS0                -W- (EC p a)    4:64
> 
> This commit reverts commit 05fd007e4629 ("console: don't prefer first
> registered if DT specifies stdout-path") restoring the original behavior.
> 
> Regards,
> 
> Hans

Ugh... so the devices you're talking about rely upon set stdout-path in their 
device tree but effectively rely upon us ignoring it?

If that's the case then I guess reverting is probably the best option, but it 
does restore us to a position where we honor stdout-path for earlycon & then 
essentially ignore it for the proper kernel console. That seems pretty bust to 
me...

Thanks,
    Paul
--nextPart10734688.zpdo6DTjzD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYHH9rAAoJEIIg2fppPBxl34sP/3eBsFz+Py27TY9MTC8SrgVA
Qz0ci+m/noH44R17XPQpIxS5xegN52A3VfL2yL/L/iPkX8eWW5btFumNusqgHlUS
wlFoAJDCUNNjdEYGZx4BIuTqDRcHl7MF2VXKo0dgTeoqO9+ayxYUrnzdX8xLKSlK
A/xL5MUeADF5iUzbuAxUrYBtvNRm6QB+KwQN6nwOe/9ichxINgp9+J7beFBhvtzM
Fg0U3kgFubSpkB2AKLly4gAXLNbGE13KWPa9SIpOzJZnr2EqAX5pQFZCZtSOTDyY
CTs5orsTDuT7hKqtLQjD21mtrF9Oan9D6JhuUd9HLz+6a9RTwiuWffMe/nTZ8UMU
+zABhTiQrfEhwOpjWYzIRMSCK5RlKEvkvP7Fa2f2j4HPD4yBmHem7bIUIE0sjkgu
1Ke/f6mfNTaBx1XFoY4xtsixS/0C4RemXlLBG7I8YThsvusI/0QrtRiCVHiMPr45
RlbuXIZAu/sXG0zRJGLCFxpS2Cl5jsKmpvYTGPlTFuQV025eCwPtM1EwsIjKVRS4
vb90X9WgoZDkzVkWc4H3IGRMquE5AZQ62i/9EtnpoVYSm4oMD6a70qSiGEx7zmLI
32lSnkoBel3IKVvX13bXr7ImhedKz3oB1QVRlfK5+1Rz2dyzE2NO0STBCt7cq+q5
HbG0b0F1Yu8mboxlVcMz
=+W3i
-----END PGP SIGNATURE-----

--nextPart10734688.zpdo6DTjzD--
