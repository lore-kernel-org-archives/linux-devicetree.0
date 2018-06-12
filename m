From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] drivers/of: Make of_io_request_and_map() "name"
 argument optional
Date: Wed, 13 Jun 2018 08:53:59 +1000
Message-ID: <9906dd0ed56e71468291ad68e24f43dd5d9b5269.camel@kernel.crashing.org>
References: <22064afa92ed2e4b33a93685aabb1d07c7c8846d.camel@kernel.crashing.org>
         <20180612221815.GA28761@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180612221815.GA28761@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2018-06-12 at 16:18 -0600, Rob Herring wrote:
> On Tue, Jun 12, 2018 at 10:01:07AM +1000, Benjamin Herrenschmidt wrote:
> > These days of_address_to_resource() puts a reasonable name
> > in the resource struct, thus make the "name" argument an
> > optional override.
> > 
> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > ---
> > 
> > Just something I noticed ... we should probably update the
> > callers to stop passing stupid names..
> 
> Sounds like a coccinelle patch.

Quite possibly, though I'm absolutely not proficient with coccinelle :-)

> When do we need an actual name passed in? It does get exposed to 
> userspace, but no one seemed to care when names changed from full path 
> (which is commonly used) to just the node name.

Not sure, I had a look at the names looked rather random.

> 
> Rob
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
