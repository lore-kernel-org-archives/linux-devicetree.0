From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] doc: printk-formats: Remove bogus kobject references
 for device nodes
Date: Fri, 12 Oct 2018 11:39:21 -0600
Message-ID: <20181012113921.04b5a4d9@lwn.net>
References: <20181008110848.25648-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008110848.25648-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "Tobin C . Harding" <me@tobin.cc>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh@kernel.org>, Petr Mladek <pmladek@suse.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon,  8 Oct 2018 13:08:48 +0200
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> When converting from text to rst, the kobjects section and its sole
> subsection about device tree nodes were coalesced into a single section,
> yielding an inconsistent result.
> 
> Remove all references to kobjects, as
>   1. Device tree object pointers are not compatible to kobject pointers
>      (the former may embed the latter, though), and
>   2. there are no printk formats defined for kobject types.
> 
> Update the vsprintf() source code comments to match the above.
> 
> Fixes: b3ed23213eab1e08 ("doc: convert printk-formats.txt to rst")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks.

jon
