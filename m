From: Matthew Wilcox <willy@infradead.org>
Subject: Re: Consistent capitalization of "device tree"?
Date: Mon, 7 Jan 2019 10:44:23 -0800
Message-ID: <20190107184423.GA6310@bombadil.infradead.org>
References: <20190107183711.GA5671@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190107183711.GA5671@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>, corbet@lwn.net, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 07, 2019 at 07:37:11PM +0100, Pavel Machek wrote:
> Is it "Device Tree" or "device tree"?
>     
>  pavel@duo:/data/l/k/Documentation$ grep -r "Device Tree"  | wc -l
>  235
>  pavel@duo:/data/l/k/Documentation$ grep -r "device tree"  | wc -l
>  595

You missed ...

$ git grep -r "Device tree" Documentation/ | wc -l
84

although at least some of those are "Capitalise device because it's the
start of a sentence".
