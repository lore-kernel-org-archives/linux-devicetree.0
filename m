From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] of: Turn of_match_node into a static inline when CONFIG_OF isn't set
Date: Tue, 11 Feb 2014 21:06 +0100
Message-ID: <3619654.tQqiI1EfTB@wuerfel>
References: <1392122211-11422-1-git-send-email-laurent.pinchart@ideasonboard.com> <20140211180845.GG841@joshc.qualcomm.com> <CAMuHMdVkPLe5986hYPApoQr7oJSb6U2P71=nP+9mtvtaskdHXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVkPLe5986hYPApoQr7oJSb6U2P71=nP+9mtvtaskdHXg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Josh Cartwright <joshc@codeaurora.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 11 February 2014 19:29:19 Geert Uytterhoeven wrote:
> On Tue, Feb 11, 2014 at 7:08 PM, Josh Cartwright <joshc@codeaurora.org> wrote:

> Ideally, all xxx_device_id look like
> 
>     struct xxx_device_id {
>             ... /* bus-specific ID information */
>             kernel_ulong_t driver_data;
>     };
> 
> This may be formalized in some way, using a base class, but thay may
> require reordering the fields, like:
> 
>     struct base_device_id {
>             kernel_ulong_t driver_data;
>             long id[0];
>     };
> 

You can't reorder the fields because they are shared with user
space in form of the module-init-tools.

	Arnd
