From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH] powerpc: make the padding for the device tree a
	configurable option
Date: Wed, 19 May 2010 20:46:19 -0500
Message-ID: <AANLkTily6AYGJbvTx-4MJm7HKeRWOuB9jpPzgVmys1sm@mail.gmail.com>
References: <1274298809-12772-1-git-send-email-timur@freescale.com>
	<1274304013.1931.6.camel@pasglop> <4BF4593E.8030101@freescale.com>
	<1274309050.1931.21.camel@pasglop>
	<AANLkTilefxXcMnWqKSultu88r4D9W98adHLHxvUwi113@mail.gmail.com>
	<20100520011820.GT25892@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20100520011820.GT25892@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Timur Tabi <timur@freescale.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, May 19, 2010 at 8:18 PM, David Gibson
<david@gibson.dropbear.id.au> wrote:

> Couldn't you use the configurable padding, but put the stuff to do it
> into u-boot. =A0i.e. repad the dtb at u-boot build time, rather than
> u-boot runtime.

That's what I was trying to do.   Take a look at this thread:

http://lists.denx.de/pipermail/u-boot/2010-May/071520.html

-- =

Timur Tabi
Linux kernel developer at Freescale
