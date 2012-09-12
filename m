From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] usb: gadget: at91_udc: dt: fix platform_data check
Date: Wed, 12 Sep 2012 09:33:53 +0200
Message-ID: <50503AE1.9060307@atmel.com>
References: <1347365267-7507-1-git-send-email-fabio.porcedda@gmail.com> <504F2C83.7080706@atmel.com> <20120912061414.GB18563@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120912061414.GB18563-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/12/2012 08:14 AM, Felipe Balbi :
> Hi,
> 
> On Tue, Sep 11, 2012 at 02:20:19PM +0200, Nicolas Ferre wrote:
>> On 09/11/2012 02:07 PM, Fabio Porcedda :
>>> Don't fail the initialization check for the platform_data if
>>> there is avaiable an associated device tree node.
>>> 
>>> This patch fix the dt support introduced in 3.4-rc1 by commit 
>>> ("d1494a3 USB: at91: Device udc add dt support").
>>> 
>>> Tested on a at91sam9260 based board (PRO3-EVK).
>>> 
>>> Signed-off-by: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> Cc:
>>> Stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> [v3.4+] Cc: Jean-Christophe
>>> PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
>> 
>> Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>> 
>> Felipe, Greg, can we queue this one for 3.6-final ?
> 
> I had already taken the other version before Fabio sent this v2...
> it's now merged in greg/usb-next branch. I suggest doing a
> cherry-pick for stable tree and resending the patch once v3.7-rc1
> is tagged.

Sure! No need to move to this v2.

We will do as you suggest for the stable branch inclusion.

Thanks, best regards,
- -- 
Nicolas Ferre
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iQEcBAEBAgAGBQJQUDrVAAoJEAf03oE53VmQ8egH/2FTpGw98GJ47MzNKFaZvbGV
2ZrQTHsO2xOKenG+Chf/0oDkKROzQYgxGjfogDQmfhYPHkdqTdSRL5CD6hZSnhDo
Qvusw9XmOdikhBcTQKrrSxOyfoo1BcKFH07TunWfM2LXWrHUptk3jMb7Un62QGVa
wFYeHdkI+gwCbzcN+b9iV/qKYmkpfv71y0uved//OVBxXuBqoKOHTNlAZ1p5OT4r
GRj0zgq4tes8W1QeXDKOCu1oMqbH1qNqnklFWu0JzoiqhX809t9rYurZTep7YzWO
5+n1zV80qpMbXeClw/GgHKvt9WmA1afMTyMNryS5PTijEauc6ifidUrikIL+NuQ=
=w2cu
-----END PGP SIGNATURE-----
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
