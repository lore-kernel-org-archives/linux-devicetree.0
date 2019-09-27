From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: [Patch v4 8/8] media: i2c: ov2659: Switch to SPDX Licensing
Date: Fri, 27 Sep 2019 22:11:07 +0100
Message-ID: <CA+V-a8v0nqLaYUTMVYpacBEKNaxaZFyivVwdaRZ4M-HEBYJ4zg@mail.gmail.com>
References: <20190927184722.31989-1-bparrot@ti.com> <20190927184722.31989-9-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927184722.31989-9-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media <linux-media@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2019 at 7:46 PM Benoit Parrot <bparrot@ti.com> wrote:
>
> Switch to SPDX licensing and drop the redundant GPL text.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/i2c/ov2659.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
>
Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar Lad

> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index 720310e0725d..e6da23d3a555 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Omnivision OV2659 CMOS Image Sensor driver
>   *
> @@ -5,19 +6,6 @@
>   *
>   * Benoit Parrot <bparrot@ti.com>
>   * Lad, Prabhakar <prabhakar.csengg@gmail.com>
> - *
> - * This program is free software; you may redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; version 2 of the License.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> - * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> - * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> - * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
> - * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> - * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> - * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> - * SOFTWARE.
>   */
>
>  #include <linux/clk.h>
> --
> 2.17.1
>
