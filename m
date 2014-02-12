From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Linux-3.14-rc2: Order of serial node compatibles in DTS files.
Date: Wed, 12 Feb 2014 12:00:04 +0100
Message-ID: <201402121200.05074.arnd@arndb.de>
References: <OF784BA598.ACFE9DA4-ONCA257C76.00827472-CA257C77.000BCFAD@csc.com> <OFB203CA90.B048F8AA-ONCA257C7C.0081A816-CA257C7C.0081DCE3@csc.com> <52FAB5A7.7080208@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52FAB5A7.7080208-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Chris Proctor <cproctor-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 12 February 2014, Sebastian Hesselbarth wrote:
> On 02/12/2014 12:38 AM, Stephen N Chivers wrote:
> > Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote on

> >> I don't think the missing compatible is causing it, but of_serial
> >> provides a DT match for .type = "serial" just to fail later on
> >> with the error seen above.
> >>
> >> The commit in question reorders of_match_device in a way that match
> >> table order is not relevant anymore. This can cause it to match
> >> .type = "serial" first here.
> >>
> >> Rather than touching the commit, I suggest to remove the problematic
> >> .type = "serial" from the match table. It is of no use anyway.
> > Deleting the "serial" line from the match table fixes the problem.
> > I tested it for both orderings of compatible.
> 
> I revert my statement about removing anything from of_serial.c. Instead
> we should try to prefer matches with compatibles over type/name without
> compatibles. Something like the patch below (compile tested only)

That would probably be a good idea. However, I think in this
case we also want to remove the line from the driver, as it clearly
never works on any hardware and the driver just errors out for the
device_type match.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
