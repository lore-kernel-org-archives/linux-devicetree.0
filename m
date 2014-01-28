From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/5] clk: sunxi: Add USB clock register defintions
Date: Tue, 28 Jan 2014 11:00:45 +0100
Message-ID: <52E77FCD.5050701@redhat.com>
References: <1390426587-16287-1-git-send-email-hdegoede@redhat.com> <1390426587-16287-3-git-send-email-hdegoede@redhat.com> <20140127144349.GJ3867@lukather> <52E67316.5020906@redhat.com> <20140128094427.GZ3867@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBPMWT2LQKGQEU75KO5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140128094427.GZ3867@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

On 01/28/2014 10:44 AM, Maxime Ripard wrote:
> On Mon, Jan 27, 2014 at 03:54:14PM +0100, Hans de Goede wrote:
>>>> "allwinner,sun5i-a13-usb-gates-clk" - for usb gates + resets on A13
>>> 
>>> Maybe we can just remove the gates from there? Even though they are gates, they are also (a bit) more than that.
>> 
>> To be clear you mean s/usb-gates-clk/usb-clk/ right ?
> 
> Yep, exactly
> 
>>> I guess that means that we will have the OHCI0 gate declared with <&...-gates-clk 6>, while it's actually the first gate for this clock?
>> 
>> Correct.
>> 
>>> Maybe introducing an offset field in the gates_data would be a good idea, so that we always start from indexing the gates from 0 in the DT?
>> 
>> Well for the other "gates" type clks we also have holes in the range, and we always refer to the clk with the bit number in the reg as the clock-cell value.
> 
> Yes, we have holes, but I see two majors differences here: - the other gates are just gates, while the usb clocks are a bit more than that.

The usb-clk registers contain more then that, but the bits we are talking
about now are gates.

> - the other gates' gating bits thus all start at bit 0, while here, since it's kind of a "mixed" clock, the gating bits start at bit 6 (on the A20 at least)

Right, still I believe that the consistent thing to do is keeping the
bit-number for the bit in the register controlling the gate as the
specifier.  When adding new dts entries / reviewing existing ones
I'm used to matching the specifier to the bit-nr in the data-sheet,
I think making things different just for this one register is counter
productive.

Regards,

Hans

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlLnf80ACgkQF3VEtJrzE/udugCdEDpN65hazG7H+FD45iOVnTY9
548An3dXeF6f8wp5REck5H3gqQPQkIoX
=6yba
-----END PGP SIGNATURE-----
