From: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 2/3] drm/bridge: Add ti-tfp410 DVI transmitter driver
Date: Wed, 16 Nov 2016 16:39:28 +0200
Message-ID: <506ba969-d753-d026-5357-3329a750ceaf@ti.com>
References: <cover.1479142062.git.jsarha@ti.com>
 <b4589c6a3275c0c7c8e3c379faedba3ce1423c5a.1479142062.git.jsarha@ti.com>
 <20161116133331.miem6us563uu62t7@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161116133331.miem6us563uu62t7@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/16/16 15:33, Rob Herring wrote:
>> +Optional properties
>> > +	- reg: I2C address. If and only if present the driver node
>> > +	  should be placed into the i2c controller node where the
>> > +	  tfp410 i2c is connected to (the current implementation does
>> > +	  not yet support this).
> So this chip can work without programming I guess?
> 

Yes. Just powering it up is enough for most application.

> reg should only be not present if I2C is not connected in the design. It 
> can't be a function of what the driver supports. In otherwords, you 
> can't be moving this node around based on when you add I2C control.
> 

Ok, I'll try to implement a dummy i2c driver at the same time too. I can
not test anything related to it because I do not have a piece of HW with
tfp410 i2c wires connected, but it should not matter as long as I am
able to probe it as a i2c client.

Thanks,
Jyri

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
