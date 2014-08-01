From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: core command line parameters with dt
Date: Fri, 1 Aug 2014 15:12:22 +0100
Message-ID: <20140801141222.GG22994@leverpostej>
References: <E70AF999396FDF4EAE40E195B84709611F8471EA@SPMDEGHN001.CADCON.INTERN>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E70AF999396FDF4EAE40E195B84709611F8471EA-VHQhki0MIenpQFNhCJRnZ0Yy6alPw7Wn0MAMd6zgKLc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Priebe, Sebastian" <Sebastian.Priebe-hnW+OuB6jW6zQB+pC5nmwQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 01, 2014 at 02:55:42PM +0100, Priebe, Sebastian wrote:
> Hello,
> 
> I want to use kernel command line parameters within my machine file.
> If I use the __setup macro I get the following build error:
> error: __setup_str_model_bt causes a section type conflict with myboard_dt_board_compat
> 
> static const char *myboard_dt_board_compat[] __initconst = {
>         "vendor,model",
>         NULL
> };

You have a section mismatch because your code evidently doesn't live in
an init section, but is trying to access data which does. The fact that
the data happens to be a list of compatible strings is irrelevant, and
this is in no way related to dt.

Figure out whether your function should live in an init section or if
the data should not. Make sure that you don't reference anything in init
section from anything else which does not itself live in an init
section. That will solve your build issue.

The name of the function sounds suspicious to begin with from a DT
perspective. You shouldn't need to override DT properties from the
command line.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
