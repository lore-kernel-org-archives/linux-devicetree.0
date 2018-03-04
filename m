From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] x86: devicetree: fix config option around
 x86_flattree_get_config()
Date: Sun, 4 Mar 2018 08:21:20 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1803040820510.1654@nanos.tec.linutronix.de>
References: <1520050346-1333-1-git-send-email-frowand.list@gmail.com> <4284204.nJkDQ6O5Aj@avalon> <cd3d7bd4-5235-2c1a-b22b-a3a3756d6704@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cd3d7bd4-5235-2c1a-b22b-a3a3756d6704@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Ivan Gorinov <ivan.gorinov@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, geert@linux-m68k.org, laurent.pinchart+renesas@ideasonboard.com
List-Id: devicetree@vger.kernel.org

On Sat, 3 Mar 2018, Frank Rowand wrote:
> I sent this patch to the x86 maintainers and to Rob because of a patch
> series that is modifying arch/x86/kernel/devicetree.c, in
> x86_flattree_get_config() [1].  It does not look like my patch will
> conflict with that patch at the moment, but it is possible that a conflict
> could develop as that patch is developed.

Even if it conflicts, its trivial enough ....
