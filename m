From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drivers/of: Make of_io_request_and_map() "name" argument
 optional
Date: Tue, 12 Jun 2018 16:18:15 -0600
Message-ID: <20180612221815.GA28761@rob-hp-laptop>
References: <22064afa92ed2e4b33a93685aabb1d07c7c8846d.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <22064afa92ed2e4b33a93685aabb1d07c7c8846d.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 12, 2018 at 10:01:07AM +1000, Benjamin Herrenschmidt wrote:
> These days of_address_to_resource() puts a reasonable name
> in the resource struct, thus make the "name" argument an
> optional override.
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
> 
> Just something I noticed ... we should probably update the
> callers to stop passing stupid names..

Sounds like a coccinelle patch.

When do we need an actual name passed in? It does get exposed to 
userspace, but no one seemed to care when names changed from full path 
(which is commonly used) to just the node name.

Rob
