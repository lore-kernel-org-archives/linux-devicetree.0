From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 10/12] video: Add ADV751[13] DT bindings documentation
Date: Thu, 25 Sep 2014 09:06:46 +0200
Message-ID: <CAMuHMdVT8AC+HeYJBSUn149D-CgcVHEiUsWYx_e--kbK06awkw@mail.gmail.com>
References: <1411589072-28609-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1411589072-28609-11-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1411589072-28609-11-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, DRI Development <dri-devel@lists.freedesktop.org>, Linux-sh list <linux-sh@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Wed, Sep 24, 2014 at 10:04 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> +- adi,input-style: The input components arrangement variant (1, 2 or 3).

What's the meaning of the numerical values 1, 2, and 3?

I found this code in "[PATCH 11/12] drm: Add adv7511 encoder driver":

+       input_style = config->input_style == 1 ? 2
+                   : (config->input_style == 2 ? 1 : 3);

which didn't really help much ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
