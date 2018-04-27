From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] of: overlay: Stop leaking resources on overlay removal
Date: Thu, 26 Apr 2018 21:19:33 -0500
Message-ID: <20180427021933.vkdmzid4ated6whe@rob-hp-laptop>
References: <e8704374-857c-d80e-e91c-89d59e1cffbe@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e8704374-857c-d80e-e91c-89d59e1cffbe@siemens.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Frank Rowand <frowand.list@gmail.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alan Tull <atull@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 26, 2018 at 01:00:30PM +0200, Jan Kiszka wrote:
> Only the overlay notifier callbacks have a chance to potentially get
> hold of references to those two resources, but they are not supposed to
> store them beyond OF_OVERLAY_POST_REMOVE.
> 
> Document the overlay notifier API, its constraint regarding pointer
> lifetime, and then remove intentional leaks of ovcs->overlay_tree and
> ovcs->fdt from free_overlay_changeset.
> 
> See also https://lkml.org/lkml/2018/4/23/1063 and following.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  Documentation/devicetree/overlay-notes.txt |  8 ++++++++
>  drivers/of/overlay.c                       | 30 +++++++++++++++++++++---------
>  2 files changed, 29 insertions(+), 9 deletions(-)

Applied, thanks.

Rob
