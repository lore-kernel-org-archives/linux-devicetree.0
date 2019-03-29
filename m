From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH V2 3/5] mtd: bcm63xxpart: move imagetag parsing to its own
 parser
Date: Thu, 28 Mar 2019 19:19:05 -0700
Message-ID: <471411ff-bd00-f7c6-7520-6f89d94afa70@gmail.com>
References: <20190328141910.5723-1-jonas.gorski@gmail.com>
 <20190328141910.5723-4-jonas.gorski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190328141910.5723-4-jonas.gorski@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Jonas Gorski <jonas.gorski@gmail.com>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org



On 3/28/2019 7:19 AM, Jonas Gorski wrote:
> Move the bcm963xx Image Tag parsing into its own partition parser. This
> Allows reusing the parser with different full flash parsers.
> 
> While moving it, rename it to bcm963* to better reflect it isn't chip,
> but reference implementation specific.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
