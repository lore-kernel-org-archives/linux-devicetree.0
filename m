From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] arm, imx6, dts: add DT for aristainetos2 board
Date: Thu, 21 May 2015 09:31:45 +0800
Message-ID: <20150521013144.GA29060@dragon>
References: <1432099863-8642-1-git-send-email-hs@denx.de>
 <1432118319.4466.40.camel@pengutronix.de>
 <555C6C72.2060302@denx.de>
 <20150521010424.GF24844@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150521010424.GF24844@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, May 21, 2015 at 09:04:25AM +0800, Shawn Guo wrote:
> On Wed, May 20, 2015 at 01:13:54PM +0200, Heiko Schocher wrote:
> > >>+ * Copyright (C) 2015 Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
> > >>+ *
> > >>+ * This file is dual-licensed: you can use it either under the terms
> > >>+ * of the GPL or the X11 license, at your option. Note that this dual
> > >>+ * licensing only applies to this file, and not this project as a
> > >>+ * whole.
> > >>+ *
> > >>+ *  a) This file is free software; you can redistribute it and/or
> > >>+ *     modify it under the terms of the GNU General Public License as
> > >>+ *     published by the Free Software Foundation; either version 2 of
> > >>+ *     the License, or (at your option) any later version.
> > >>+ *
> > >>+ *     This file is distributed in the hope that it will be useful,
> > >>+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> > >>+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > >>+ *     GNU General Public License for more details.
> > >>+ *
> > >>+ *     You should have received a copy of the GNU General Public
> > >>+ *     License along with this file; if not, write to the Free
> > >>+ *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
> > >>+ *     MA 02110-1301 USA
> > >
> > >checkpatch warns that you should not include this paragraph because the
> > >mail address might change in the future and it is contained in COPYING.
> > 
> > Hmm... Shawn mentioned to change it to the "GPL/X11 dual licence"
> > as in the arch/arm/boot/dts/imx6sl-warp.dts file ... so I copied this
> > from there ... is there a better option for this?
> 
> It seems I pointed you to a bad example.  Let me try again, see
> arch/arm/boot/dts/imx6q-hummingboard.dts for example.

Just saw a patch from Fabio fixing license text a bit for the file, the
following is the one with the fix-up.

/*
 * Copyright (C) 2014 Rabeeh Khoury (rabeeh-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org)
 * Based on dt work by Russell King
 *
 * This file is dual-licensed: you can use it either under the terms
 * of the GPL or the X11 license, at your option. Note that this dual
 * licensing only applies to this file, and not this project as a
 * whole.
 *
 *  a) This file is free software; you can redistribute it and/or
 *     modify it under the terms of the GNU General Public License
 *     version 2 as published by the Free Software Foundation.
 *
 *     This file is distributed in the hope that it will be useful
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *     GNU General Public License for more details.
 *
 * Or, alternatively
 *
 *  b) Permission is hereby granted, free of charge, to any person
 *     obtaining a copy of this software and associated documentation
 *     files (the "Software"), to deal in the Software without
 *     restriction, including without limitation the rights to use
 *     copy, modify, merge, publish, distribute, sublicense, and/or
 *     sell copies of the Software, and to permit persons to whom the
 *     Software is furnished to do so, subject to the following
 *     conditions:
 *
 *     The above copyright notice and this permission notice shall be
 *     included in all copies or substantial portions of the Software.
 *
 *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
 *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
 *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 *     OTHER DEALINGS IN THE SOFTWARE.
 */
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
