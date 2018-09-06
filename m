From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 18/21] edac: cpc925: use for_each_of_cpu_node iterator
Date: Thu, 6 Sep 2018 14:20:37 +0200
Message-ID: <20180906122037.GE10768@zn.tnic>
References: <20180905193738.19325-1-robh@kernel.org>
 <20180905193738.19325-19-robh@kernel.org>
 <20180906083506.GA10768@zn.tnic>
 <CAL_JsqKNh+89dRef3RNx1YUfhD0yJ8BHsanUaGMfrF_EGPCHcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKNh+89dRef3RNx1YUfhD0yJ8BHsanUaGMfrF_EGPCHcA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 06, 2018 at 06:12:51AM -0500, Rob Herring wrote:
> I should have noted this. It's not the kernel's job to validate the DT
> and certainly not some driver's job to validate cpu nodes. It's bad
> enough that some random driver is parsing cpu nodes. If they are
> missing or are crap, you should get warnings or messages well before
> this point.

That is useful info for the commit message, I'd say.

In any case:

Acked-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
