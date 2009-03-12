From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: I2C not working upon 2.6.24 to 2.6.28 kernel upgrade
Date: Thu, 12 Mar 2009 12:08:07 -0600
Message-ID: <fa686aa40903121108p50338218w18714686d1f8bdbf@mail.gmail.com>
References: <ba5d9360903121037m6d5be5e9m4b164d56bd6b5f3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <ba5d9360903121037m6d5be5e9m4b164d56bd6b5f3-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Johns Daniel <johns.daniel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 12, 2009 at 11:37 AM, Johns Daniel <johns.daniel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> We have had this device tree (a section shown below) working for a long t=
ime:
> =A0 =A0 =A0 =A0soc8343@e0000000 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#address-cells =3D <1>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#size-cells =3D <1>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#interrupt-cells =3D <2>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0device_type =3D "soc";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ranges =3D <00000000 e0000000 00100000>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <e0000000 00000200>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bus-frequency =3D <0>;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i2c@3000 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0device_type =3D "i2c";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "fsl-i2c";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <3000 100>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0interrupts =3D <e 8>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0interrupt-parent =3D <700>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dfsrr;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> ...
> }
>
> With linux-2.6.24, it worked with this struct defined in the
> board-specific file:
> =A0 =A0 =A0 =A0 =A0static struct of_device_id __initdata of_bus_ids[] =3D=
 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{ .compatible =3D "fsl,pq2pro-localbus", },
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{},
> =A0 =A0 =A0 =A0 =A0};

This doesn't make much sense since the snippit above doesn't show a
compatible value in the soc node.

> With linux-2.6.28, it needs the following struct in the board-specific
> file for I2C to work:
> =A0 =A0 =A0 =A0 =A0static struct of_device_id __initdata of_bus_ids[] =3D=
 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{ .type =3D "soc", },
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{ .name =3D "localbus", },
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{},
> =A0 =A0 =A0 =A0 =A0};
>
> Is this easily explained?

Binding on device_type or name is strongly discouraged, so the above
snippit isn't a good idea.

Is it okay to add a property to your device tree?  If so, then add:
compatible =3D "fsl,mpc8315-immr", "simple-bus" and make sure that {
.compatible =3D "simple-bus"} is in the of_bus_ids list.  Adding this
property will not break older versions of the kernel.

> What is the right way to do this now? Ideally, I would like to keep
> the device tree unchanged since I need for it to work with older
> versions of the kernel!

compatible =3D "simple-bus" is the right way to describe simple memory
mapped translations like on the internally memory mapped registers.

Cheers,
g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
