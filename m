From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC 0/3] New idle device-tree format and support for versioned
 stop state
Date: Tue, 27 Aug 2019 19:31:02 +1000
Message-ID: <1566894003.kb57vy8ri2.astroid@bobo.none>
References: <20190823070940.43220-1-huntbag@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190823070940.43220-1-huntbag@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Abhishek Goel <huntbag@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, paulus@samba.org
Cc: daniel.lezcano@linaro.org, ego@linux.vnet.ibm.com, mikey@neuling.org, mpe@ellerman.id.au, rjw@rjwysocki.net, svaidy@linux.ibm.com
List-Id: devicetree@vger.kernel.org

Abhishek Goel's on August 23, 2019 5:09 pm:
> Background
> ------------------
>=20
> Previously if a older kernel runs on a newer firmware, it may enable
> all available states irrespective of its capability of handling it.
> Consider a case that some stop state has a bug, we end up disabling all
> the stop states. This patch introduces selective control to solve this
> problem.
>=20
> Previous version of these patches can be found at:
> https://lkml.org/lkml/2018/10/11/544
> These patch however also had patches for support of opal save-restore
> which now I am decoupling and will take them seperately.
> I have posted the corresponding skiboot patches for this kernel patchset
> here : https://patchwork.ozlabs.org/cover/1144587/
>=20
> What's new?
> --------------------
>=20
> Add stop states under ibm,idle-states in addition to the current array
> based device tree properties.
>=20
> New device tree format adds a compatible flag which has version
> corresponding to every state, so that only kernel which has the capabilit=
y
> to handle the version of stop state will enable it. Drawback of the array
> based dt node is that versioning of idle states is not possible.
>=20
> Older kernel will still see stop0 and stop0_lite in older format and we
> will deprecate it after some time.
>=20
> Consider a case that stop4 has a bug. We take the following steps to
> mitigate the problem.
>=20
> 1) Change compatible string for stop4 in OPAL to "stop4,v2" from
> "stop4,v1", i.e. basicallly bump up the previous version and ship the
> new firmware.
>=20
> 2) The kernel will ignore stop4 as it won't be able to recognize this
> new version. Kernel will also ignore all the deeper states because its
> possible that a cpu have requested for a deeper state but was never able
> to enter into it. But we will still have shallower states that are there
> before stop 4. This, thus prevents from completely disabling stop states.
>=20
> Linux kernel can now look at the version string and decide if it has the
> ability to handle that idle state. Henceforth, if kernel does not know
> about a version, it will skip that state and all the deeper state.
>=20
> Once when the workaround are implemented into the kernel, we can bump up
> the known version in kernel for that state, so that support can be
> enabled once again in kernel.
>=20
> New Device-tree :
>=20
> Final output
>        power-mgt {
>             ...
>          ibm,enabled-stop-levels =3D <0xec000000>;
>          ibm,cpu-idle-state-psscr-mask =3D <0x0 0x3003ff 0x0 0x3003ff>;
>          ibm,cpu-idle-state-latencies-ns =3D <0x3e8 0x7d0>;
>          ibm,cpu-idle-state-psscr =3D <0x0 0x330 0x0 0x300330>;
>          ibm,cpu-idle-state-flags =3D <0x100000 0x101000>;
>          ibm,cpu-idle-state-residency-ns =3D <0x2710 0x4e20>;
>          ibm,idle-states {
>                      stop4 {
>                          flags =3D <0x207000>;
>                          compatible =3D "stop4,v1",
>                          psscr-mask =3D <0x0 0x3003ff>;
>                          latency-ns =3D <0x186a0>;
>                          residency-ns =3D <0x989680>;
>                          psscr =3D <0x0 0x300374>;
> 			 ...
>                   };
>                     ...
>                     stop11 {
>                          ...
>                          compatible =3D "stop11,v1",
>                          ...
>                   };
>              };

I'm not sure about this. I think the real problem we have is that the
OPAL stop API is not actually implementation independent. Because we
*can* selectively disable stop states in the firmware if there is a
hardware/firmware problem with them.

So we need a way to rev ISA/Book4/OPAL stuff so the kernel won't try
to use it if it's incapable.

We have that today in dt-cpu-ftrs. POWER9 advertises the "idle-stop"
feature. An incompatible implementation could advertise idle-stop-v4.

That won't allow individual states to remain back compatible, but if=20
there is a new implementation which changes any behaviour it needs to be=20
incopmatible, even if Linux happens to not rely on said behaviour yet. =20
So I don't think we can keep any of them (except stop0 lite) compatible,=20
so I don't see a real downside (we'll have to discuss this offline).

Thanks,
Nick
=
