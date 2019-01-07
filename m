From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: Consistent capitalization of "device tree"?
Date: Mon, 7 Jan 2019 11:06:27 -0800
Message-ID: <91bc4723-8e3a-4ed6-5104-36a614d6a6d2@gmail.com>
References: <20190107183711.GA5671@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107183711.GA5671@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>, corbet@lwn.net, linux-doc@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org


+ Frank

On 1/7/19 10:37 AM, Pavel Machek wrote:
> Is it "Device Tree" or "device tree"?
>     
>  pavel@duo:/data/l/k/Documentation$ grep -r "Device Tree"  | wc -l
>  235
>  pavel@duo:/data/l/k/Documentation$ grep -r "device tree"  | wc -l
>  595
>     
> I guess it would be nice to make it consistent. I guess "device tree"
> is preffered?
> 
> Should we do something like this?
> 								Pavel
> 
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
>     
> diff --git a/Documentation/devicetree/overlay-notes.txt b/Documentation/devicetree/overlay-notes.txt
> index 725fb8d..cc5f507 100644
> --- a/Documentation/devicetree/overlay-notes.txt
> +++ b/Documentation/devicetree/overlay-notes.txt
> @@ -8,7 +8,7 @@ companion document to Documentation/devicetree/dynamic-resolution-notes.txt[1]
>  How overlays work
>  -----------------
>  
> -A Device Tree's overlay purpose is to modify the kernel's live tree, and
> +A device tree's overlay purpose is to modify the kernel's live tree, and
>  have the modification affecting the state of the kernel in a way that
>  is reflecting the changes.
>  Since the kernel mainly deals with devices, any new device node that result
> 

Not a strong opinion, but I would prefer a third option of devicetree.  That
makes it much easier to search for.

-Frank
