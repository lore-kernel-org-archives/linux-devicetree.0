From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v3] gpio: Add device driver for GRGPIO cores and support
 custom accessors with gpio-generic
Date: Sat, 02 Mar 2013 20:13:02 +0000
Message-ID: <20130302201302.E16FE3E219B@localhost>
References: <1360653873-25368-1-git-send-email-andreas@gaisler.com>
 <CACRpkdaYQSrzm_Yj3ZH9YZLC_zPJN06X-9ZM9jd7=X0OB1shXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdaYQSrzm_Yj3ZH9YZLC_zPJN06X-9ZM9jd7=X0OB1shXQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Cc: Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, software-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 1 Mar 2013 01:24:01 +0100, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Feb 12, 2013 at 8:24 AM, Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org> wrote:
> 
> > This driver supports GRGPIO gpio cores available in the GRLIB VHDL IP
> > core library from Aeroflex Gaisler.
> >
> > This also adds support to gpio-generic for using custom accessor
> > functions. The grgpio driver uses this to use ioread32be and iowrite32be
> > for big endian register accesses.
> >
> > Signed-off-by: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
> 
> Can you split this in two patches: one that adds the custom accessors
> and one that adds the driver?

Yes please, and as commented on in the other thread you can go ahead and
add the BE accessors to gpio-generic.c. I would like to optimize things
in gpiolib to make a lot of gpio-generic.c unnecessary, but that is only
an idea at this point.

g.
