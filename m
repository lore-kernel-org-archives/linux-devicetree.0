From: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Subject: Re: [PATCH 0/2] Use SPDX-License-Identifier for rockchip devicetree files
Date: Fri, 15 Dec 2017 14:45:34 +0100
Message-ID: <CAOFm3uHba4kBD81thpxSpDBsDS4Y5m7cN2jfYt_uT5atdSDmqg@mail.gmail.com>
References: <20171215114427.32059-1-klaus.goger@theobroma-systems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215114427.32059-1-klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Klaus Goger <klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Simon Xue <xxm-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Liang Chen <cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Huibin Hong <huibin.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Finley Xiao <finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>, William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard@free->
List-Id: devicetree@vger.kernel.org

Klaus,

On Fri, Dec 15, 2017 at 12:44 PM, Klaus Goger
<klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org> wrote:
> This patch series replaces all the license text in rockchip devicetree
> files text with a proper SPDX-License-Identifier.
> It follows the guidelines submitted[1] by Thomas Gleixner that are not
> yet merged.
>
> These series also fixes the issue with contradicting statements in most
> licenses. The introduction text claims to be GPL or X11[2] but the
> following verbatim copy of the license is actually a MIT[3] license.
> The X11 license includes a advertise clause and trademark information
> related to the X Consortium. As these X Consortium specfic points are
> irrelevant for us we stick with the actuall license text.
>
> [1] https://patchwork.kernel.org/patch/10091607/
> [2] https://spdx.org/licenses/X11.html
> [3] https://spdx.org/licenses/MIT.html

FWIW, the X11 license name was not always something clearly defined.
SPDX calls it clearly MIT which is the most widely accepted name for
the corresponding text. And this is also what we have in Thomas doc
patches that should be the kernel reference.

Also, as a general note, you want to make sure that such as patch set
is not merged by mistake until you have collected an explicit review
or ack from all the copyright holders involved.

May be calling it an "RFC" could be best until you have these acks?

-- 
Cordially
Philippe Ombredanne
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
