From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] drivers/of: Export phandle iterators
Date: Thu, 24 Nov 2016 12:33:30 +0000
Message-ID: <18302005-166c-37b9-6e6d-35804ff685ff@arm.com>
References: <a1fa1157cab10f2a6f319d431d355cef79b91820.1479927866.git.robin.murphy@arm.com>
 <CAL_JsqLNCZnKyUmzYAuJSLhVNf1MhnSp_uEw4jn=WcLsw2GCZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLNCZnKyUmzYAuJSLhVNf1MhnSp_uEw4jn=WcLsw2GCZQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 23/11/16 21:49, Rob Herring wrote:
> On Wed, Nov 23, 2016 at 1:06 PM, Robin Murphy <robin.murphy@arm.com> wrote:
>> Modular drivers may want to use of_for_each_phandle() - export its
>> constituent functions.
> 
> Do you have a user?

I've been experimenting with modular IOMMU drivers on top of the
probe-deferral stuff[1], and the ARM SMMU driver in particular demands a
whole pile of exports. I thought I'd throw this one out now since nearly
all the other of_* functions are exported already, but I'm quite happy
to sit on it if you'd prefer to wait for a concrete in-tree need (it'll
be a while yet).

Robin.

[1]:http://www.linux-arm.org/git?p=linux-rm.git;a=shortlog;h=refs/heads/iommu/defer
