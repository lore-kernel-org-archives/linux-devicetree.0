From: =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio@elopez.com.ar>
Subject: Re: [PATCH V2 4/7] kbuild: always run gcc -E on *.dts, remove cmd_dtc_cpp
Date: Wed, 03 Apr 2013 21:02:31 -0300
Message-ID: <515CC317.2000703@elopez.com.ar>
References: <1365032098-22825-1-git-send-email-swarren@wwwdotorg.org> <1365032098-22825-4-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1365032098-22825-4-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Michal Marek <mmarek@suse.cz>, Grant Likely <glikely@secretlab.ca>, Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@nvidia.com>, linux-kbuild@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, arm@kernel.org, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org, Hiroshi Doyu <hdoyu@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

El 03/04/13 20:34, Stephen Warren escribi=F3:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> Replace cmd_dtc with cmd_dtc_cpp, and delete the latter.
>=20
> Previously, a special file extension (.dtsp) was required to trigger
> the C pre-processor to run on device tree files. This was ugly. Now t=
hat
> previous changes have enhanced cmd_dtc_cpp to collect dependency
> information from both gcc -E and dtc, we can transparently run the pr=
e-
> processor on all device tree files, irrespective of whether they
>=20

I think a line got dropped on the commit description by mistake.

Regards,

Emilio
