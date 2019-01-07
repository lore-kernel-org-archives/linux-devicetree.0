From: Rob Herring <robh@kernel.org>
Subject: Re: Consistent capitalization of "device tree"?
Date: Mon, 7 Jan 2019 12:45:43 -0600
Message-ID: <CAL_JsqKzs4WoJoe_uCzhS3NBGfHiTQ96GkfSRhtxeah0THoVyw@mail.gmail.com>
References: <20190107183711.GA5671@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107183711.GA5671@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: devicetree@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 7, 2019 at 12:37 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> Is it "Device Tree" or "device tree"?
>
>  pavel@duo:/data/l/k/Documentation$ grep -r "Device Tree"  | wc -l
>  235
>  pavel@duo:/data/l/k/Documentation$ grep -r "device tree"  | wc -l
>  595
>
> I guess it would be nice to make it consistent. I guess "device tree"
> is preffered?

Well, the spec uses "devicetree" with capital 'D' as needed (titles
and start of sentences). I didn't check if we're 100% consistent
there.

> Should we do something like this?

I'll take patches, but it wouldn't be at the top of my list.

Rob
