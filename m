From: "Wang, Yalin" <Yalin.Wang@sonymobile.com>
Subject: RE: [RFC] fdt:free the fdt reserved memory
Date: Thu, 25 Sep 2014 11:03:33 +0800
Message-ID: <35FD53F367049845BC99AC72306C23D103D6DB491635@CNBJMBX05.corpusers.net>
References: <35FD53F367049845BC99AC72306C23D103D6DB49161A@CNBJMBX05.corpusers.net>
 <20140924144520.697A8C40738@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140924144520.697A8C40738@trevor.secretlab.ca>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: 'Grant Likely' <grant.likely@linaro.org>, "'robh+dt@kernel.org'" <robh+dt@kernel.org>, "'devicetree@vger.kernel.org'" <devicetree@vger.kernel.org>, "'pawel.moll@arm.com'" <pawel.moll@arm.com>, "'mark.rutland@arm.com'" <mark.rutland@arm.com>, "'ijc+devicetree@hellion.org.uk'" <ijc+devicetree@hellion.org.uk>, "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> On Thu, 18 Sep 2014 17:25:12 +0800, "Wang, Yalin"
> <Yalin.Wang@sonymobile.com> wrote:
> > This patch make some change to unflatten_dt_node(), make sure the
> > device_node don't reference to fdt raw blob memory, so that we can
> > free the raw blob reserved memory after initcalls.
> >
> > Signed-off-by: Yalin Wang <yalin.wang@sonymobile.com>
> 
> Do you have any measurements showing a change in available memory before
> and after the patch?
> 
> g.
> 

I test it on ARM,
Fdt is 164K,
<6>[    5.134319] Freeing fdt memory: 164K


Before this patch, the total memory of kernel is,
MemTotal:         883224 kB

After apply this patch,
MemTotal:         883236 kB

We can get more 12KB memory.

Thanks
