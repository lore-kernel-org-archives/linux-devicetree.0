From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 0/6] Shrinking DT memory usage
Date: Fri, 6 Oct 2017 17:30:25 -0400 (EDT)
Message-ID: <nycvar.YSQ.7.76.1710061726330.1834@knanqh.ubzr>
References: <20171005194422.26224-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005194422.26224-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Grant Likely <glikely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Thu, 5 Oct 2017, Rob Herring wrote:

> On kernels with a minimal config and a RAM target in the 100s of KB, DT 
> is quite a hog of runtime memory usage. How much is dependent on how many
> nodes and properties in the DT which have a corresponding struct device_node
> and struct property in the kernel. Just skipping disabled nodes saves a 
> lot by not creating the device_nodes in the first place[1], but there's 
> more low hanging fruit by making some of the fields in struct property and
> struct device_node optional. With the changes here, the memory usage goes
> from 17KB to under 8KB on QEMU's ARM virt machine which is a relatively 
> small DT.

My test case went from 118072 bytes ddown to 21548 bytes with this 
series.

Tested-by: Nicolas Pitre <nico@linaro.org>


Nicolas
