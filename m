From: David Miller <davem@redhat.com>
Subject: Re: [PATCH v2 net-next 1/2] net: nixge: Separate ctrl and dma
 resources
Date: Sat, 02 Feb 2019 20:10:25 -0800 (PST)
Message-ID: <20190202.201025.1831371623652661602.davem@redhat.com>
References: <20190131213328.11236-1-alex.williams@ettus.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190131213328.11236-1-alex.williams@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alex.williams@ettus.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, mdf@kernel.org, mcgrof@kernel.org, keescook@chromium.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alex.williams@ni.com
List-Id: devicetree@vger.kernel.org

From: alex.williams@ettus.com
Date: Thu, 31 Jan 2019 13:33:27 -0800

> From: Alex Williams <alex.williams@ni.com>
> 
> The DMA engine is a separate entity altogether, and this allows the DMA
> controller's address to float elsewhere in the FPGA's map.
> 
> Signed-off-by: Alex Williams <alex.williams@ni.com>

Applied.
