From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 2/4] i3c: master: Check if devices have
 i3c_dev_boardinfo on i3c_master_add_i3c_dev_locked()
Date: Thu, 29 Aug 2019 16:39:41 +0200
Message-ID: <20190829163941.45380b19@collabora.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
        <3e21481ddf53ea58f5899df6ec542b79b8cbcd68.1567071213.git.vitor.soares@synopsys.com>
        <20190829124457.3a750932@collabora.com>
        <SN6PR12MB265551F73B9B516CACB5B807AEA20@SN6PR12MB2655.namprd12.prod.outlook.com>
        <20190829163918.571fd0d8@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829163918.571fd0d8@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vitor Soares <Vitor.Soares@synopsys.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>
List-Id: devicetree@vger.kernel.org

On Thu, 29 Aug 2019 16:39:18 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Thu, 29 Aug 2019 14:00:44 +0000
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> 
> > Hi Boris,
> > 
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > Date: Thu, Aug 29, 2019 at 11:44:57
> >   
> > > On Thu, 29 Aug 2019 12:19:33 +0200
> > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > >     
> > > > The I3C devices described in DT might not be attached to the master which
> > > > doesn't allow to assign a specific dynamic address.    
> > > 
> > > I remember testing this when developing the framework, so, unless
> > > another patch regressed it, it should already work. I suspect patch 1
> > > is actually the regressing this use case.    
> > 
> > For today it doesn't address the case where the device is described with 
> > static address = 0, which isn't attached to the controller.  
> 
> Hm, I'm pretty sure I had designed the code to support that case (see
> [1]). It might be buggy, but nothing we can't fix I guess.
> 

[1]https://elixir.bootlin.com/linux/v5.3-rc6/source/drivers/i3c/master.c#L1898
