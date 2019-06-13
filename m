From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: clock: Add silabs,si5341
Date: Thu, 13 Jun 2019 16:41:51 -0600
Message-ID: <20190613224151.GA32304@bogus>
References: <20190424090216.18417-1-mike.looijmans@topic.nl>
 <155623344648.15276.18213024444708122458@swboyd.mtv.corp.google.com>
 <3ea2d720-f49b-586c-e402-07db289b39a8@topic.nl>
 <155632584222.168659.9675557812377718927@swboyd.mtv.corp.google.com>
 <cd52a35b-d289-24e1-70db-9d63fd9f6448@topic.nl>
 <20190507140413.28335-1-mike.looijmans@topic.nl>
 <20190513203146.GA24085@bogus>
 <20190517132020.31081-1-mike.looijmans@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517132020.31081-1-mike.looijmans@topic.nl>
Sender: linux-kernel-owner@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Mike Looijmans <mike.looijmans@topic.nl>
List-Id: devicetree@vger.kernel.org

On Fri, 17 May 2019 15:20:20 +0200, Mike Looijmans wrote:
> Adds the devicetree bindings for the Si5341 and Si5340 chips from
> Silicon Labs. These are multiple-input multiple-output clock
> synthesizers.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> 
> ---
> v3: Remove synthesizers child nodes
>     Fix typo
> v2: Add data sheet reference.
>     Restructured to enable use of "assigned-clock*" properties to set
>     up both outputs and internal synthesizers.
>     Nicer indentation.
>     Updated subject line and body of commit message.
> 
>  .../bindings/clock/silabs,si5341.txt          | 162 ++++++++++++++++++
>  1 file changed, 162 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/silabs,si5341.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
