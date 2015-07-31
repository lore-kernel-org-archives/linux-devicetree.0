From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 5/5] mtd: ofpart: move ofpart partitions to a
 dedicated dt node
Date: Fri, 31 Jul 2015 19:24:58 +0200
Message-ID: <20150731192458.457c6c9d@bbrezillon>
References: <cover.1438340815.git.hramrach@gmail.com>
	<4982216b5cb602c71ade6810cecdb9535e0862fc.1438340815.git.hramrach@gmail.com>
	<20150731180614.162852ee@bbrezillon>
	<CAOMqctROw6wrKa+3jF275m=nd6qy7mRy0k3ztJB5s2Vy8r=DZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMqctROw6wrKa+3jF275m=nd6qy7mRy0k3ztJB5s2Vy8r=DZw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Suchanek <hramrach@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, 31 Jul 2015 18:52:01 +0200
Michal Suchanek <hramrach@gmail.com> wrote:


> >
> >>               (*pparts)[i].offset = of_read_number(reg, a_cells);
> >>               (*pparts)[i].size = of_read_number(reg + a_cells, s_cells);
> >>
> >> @@ -92,15 +116,15 @@ static int parse_ofpart_partitions(struct mtd_info *master,
> >>               i++;
> >>       }
> >>
> >> -     if (!i) {
> >> -             of_node_put(pp);
> >> -             pr_err("No valid partition found on %s\n", node->full_name);
> >> -             kfree(*pparts);
> >> -             *pparts = NULL;
> >> -             return -EINVAL;
> >> -     }
> >> -
> >
> > Are you sure you can safely remove this check?
> 
> Yes. It was incomplete check to reject some partitioning schemes
> considered invalid.
> 
> Now there is stricter checking above so this can be removed.

Indeed, I was worried about resources deallocation, but this is handle
by the caller, and if nr_parts is zero the master MTD device will
be exposed.




-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
