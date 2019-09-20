From: Benoit Parrot <bparrot@ti.com>
Subject: Re: [Patch v2 10/13] media: am437x-vpfe: Remove print_fourcc helper
Date: Fri, 20 Sep 2019 07:18:37 -0500
Message-ID: <20190920121837.bnhmgnknh72m4ujw@ti.com>
References: <20190919204125.15254-1-bparrot@ti.com>
 <20190919204125.15254-11-bparrot@ti.com>
 <455387f7-3211-c032-c6c0-a15100f123d1@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <455387f7-3211-c032-c6c0-a15100f123d1@xs4all.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hans Verkuil <hverkuil@xs4all.nl> wrote on Fri [2019-Sep-20 10:21:17 +0200]:
> On 9/19/19 10:41 PM, Benoit Parrot wrote:
> > print_fourcc helper function was used for debug log to
> > convert a pixel format code into its readable form for display
> > purposes. But since it used a single static buffer to perform
> > the conversion this might lead to display format issue when more
> > than one instance was invoked simultaneously.
> > 
> > It turns out that print_fourcc can be safely replace by using
> > "%4pE" instead and passing the pointer to the fourcc code.
> 
> If this series is merged:
> 
> https://www.mail-archive.com/linux-media@vger.kernel.org/msg149985.html
> 
> then this patch needs to be rewritten. So I'll skip this patch for now.

Ok I'll monnitor the status of this patch and see if/when I'll rebase this
one.

Benoit

> 
> Regards,
> 
> 	Hans
> 
