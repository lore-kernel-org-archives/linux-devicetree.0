From: "M. Warner Losh" <imp@bsdimp.com>
Subject: Re: [PATCH] powerpc/fsl: add device tree binding for QE firmware
Date: Wed, 24 Mar 2010 12:24:28 -0600 (MDT)
Message-ID: <20100324.122428.1108826596399277216.imp@bsdimp.com>
References: <90D93687-940F-47FB-8CEA-F3C065EA611D@kernel.crashing.org>
	<fa686aa41003241007mf6052d5s4643795f4a87cdcf@mail.gmail.com>
	<4BAA4C8A.70104@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <4BAA4C8A.70104@freescale.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: timur@freescale.com
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

In message: <4BAA4C8A.70104@freescale.com>
            Timur Tabi <timur@freescale.com> writes: 
: Most firmware is 8-12KB, so this will make for one ugly DTS.  Plus,
: there's the issue of distributing non-GPL firmware data inside a
: DTS, which is GPL.

Is there some reason that the firmware couldn't be loaded by uboot as
part of its initialization?

Warner
