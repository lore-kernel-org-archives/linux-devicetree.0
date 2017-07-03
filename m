From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] media: adv7180: add missing adv7180cp, adv7180st i2c
 device IDs
Date: Mon, 3 Jul 2017 14:05:08 +0200
Message-ID: <CAMuHMdWFjZFmuA_ubhfdAzTu09F1ZNScP+JT1CgQ-iD-44eL=g@mail.gmail.com>
References: <1499071413-609-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1499071413-609-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Simon Horman <horms@verge.net.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Ulrich,

On Mon, Jul 3, 2017 at 10:43 AM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Fixes a crash on Renesas R8A7793 Gose board that uses these "compatible"
> entries.

Thanks!

> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
(i.e. it no longer crashes during boot).

Gr{oetje,eeting}s,

                        Geert
