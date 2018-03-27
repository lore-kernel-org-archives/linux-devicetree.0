From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH net-next 4/8] dt-bindings: net: add DT bindings for
 Microsemi Ocelot Switch
Date: Mon, 26 Mar 2018 19:34:29 -0500
Message-ID: <CAL_Jsq+T+TpoLixbi+jrrtUSp_wRSwrrP2Oe2igbapoFonx1FA@mail.gmail.com>
References: <20180323201117.8416-1-alexandre.belloni@bootlin.com>
 <20180323201117.8416-5-alexandre.belloni@bootlin.com> <a5db6109-c5d9-f573-893c-f7d66c3168c2@gmail.com>
 <20180326222514.4eciw66aihhcjgtw@rob-hp-laptop> <20180326225020.GF5862@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180326225020.GF5862@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, "David S . Miller" <davem@davemloft.net>, Allan Nielsen <Allan.Nielsen@microsemi.com>, razvan.stefanescu@nxp.com, Po Liu <po.liu@nxp.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 26, 2018 at 5:50 PM, Andrew Lunn <andrew@lunn.ch> wrote:
>> ports and port collide with the OF graph binding. It would be good if
>> this moved to ethernet-port(s) or similar.
>
> Hi Rob
>
> Well, we have been using port in DSA since March 2013. ports is a bit
> newer, June 2016.

Yes, understood.

>
> Changing DSA is not going to happen. But new switch bindings could use
> ethernet-port(s). It just makes them inconsistent with existing switch
> drivers.

I'm not saying to change existing bindings, but evolve to something
that doesn't collide on new bindings if you don't have dependencies on
what the node names are. It's mainly so we can have something to key
off of to validate bindings better.

Rob
