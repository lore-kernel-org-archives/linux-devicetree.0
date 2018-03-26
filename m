From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 4/8] dt-bindings: net: add DT bindings for
 Microsemi Ocelot Switch
Date: Tue, 27 Mar 2018 00:50:20 +0200
Message-ID: <20180326225020.GF5862@lunn.ch>
References: <20180323201117.8416-1-alexandre.belloni@bootlin.com>
 <20180323201117.8416-5-alexandre.belloni@bootlin.com>
 <a5db6109-c5d9-f573-893c-f7d66c3168c2@gmail.com>
 <20180326222514.4eciw66aihhcjgtw@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180326222514.4eciw66aihhcjgtw@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, "David S . Miller" <davem@davemloft.net>, Allan Nielsen <Allan.Nielsen@microsemi.com>, razvan.stefanescu@nxp.com, po.liu@nxp.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

> ports and port collide with the OF graph binding. It would be good if 
> this moved to ethernet-port(s) or similar.

Hi Rob

Well, we have been using port in DSA since March 2013. ports is a bit
newer, June 2016.

Changing DSA is not going to happen. But new switch bindings could use
ethernet-port(s). It just makes them inconsistent with existing switch
drivers.

       Andrew
