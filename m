From: Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
Subject: Re: SPDX-License-Identifier
Date: Wed, 4 Feb 2015 23:21:06 -0500
Message-ID: <20150205042106.GK2509@thunk.org>
References: <774153d4-d33f-4bb4-813b-582762bc3af9@TX2EHSMHS021.ehs.local>
 <20140220182257.GF23217@saruman.home>
 <5306F458.9010706@monstr.eu>
 <20140221160442.GA17506@kroah.com>
 <5307790A.4050806@monstr.eu>
 <20140221161246.GM31902@saruman.home>
 <53077C5F.9000407@monstr.eu>
 <54CF9B12.2070807@denx.de>
 <20150202160622.GA9852@kroah.com>
 <54D24BA4.3070509@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54D24BA4.3070509-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 04, 2015 at 05:41:08PM +0100, Stefan Roese wrote:
> Because of this it is really important to know the exact license(s) for each
> and every file. And they can vary very much. Here some examples:
> 
> GPL v3 or later:
> 
> 	scripts/dtc/dtc-parser.tab.c_shipped
> 	scripts/dtc/dtc-parser.tab.h_shipped
> 	scripts/kconfig/zconf.tab.c_shipped
> 	scripts/genksyms/parse.tab.h_shipped
> 	scripts/genksyms/parse.tab.c_shipped

I certainly hope the automated license clearing tools are smart enough
to distinguish random GPLv3 source files with the output of Bison
which has the additional clause:

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

Otherwise, these automated tools which general much noise that will
lead to panic-stricken legal beagles to seriously annoy the kernel
developers....

						- Ted
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
