From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: Request review of device tree documentation
Date: Sun, 13 Jun 2010 23:40:43 -0600
Message-ID: <AANLkTimc84MnPvfZgVHoSkQuruS1KzLId_EgYl3DJn6w@mail.gmail.com>
References: <AANLkTilK4YkRMJqlcRDOAlGBzpdlZuSo9NF5NrRNocHT@mail.gmail.com>
	<1276311610.1962.173.camel@pasglop> <1276312071.1962.175.camel@pasglop>
	<201006132112.36728.jeremy.kerr@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <201006132112.36728.jeremy.kerr@canonical.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Jeremy Kerr <jeremy.kerr@canonical.com>
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Olof Johansson <olof@lixom.net>, microblaze-uclinux@itee.uq.edu.au
List-Id: devicetree@vger.kernel.org

On Sun, Jun 13, 2010 at 7:12 AM, Jeremy Kerr <jeremy.kerr@canonical.com> wrote:
> hi Ben,
>
>> Maybe a paragraph on the new proposed clock binding that Jeremy is
>> working would be of use btw.
>
> Here's one I prepared earlier:
>
> http://devicetree.org/ClockBindings

Yup, but the documents have difference purposes.  ClockBindings is the
formal description.  Device_Tree_Usage leads someone step by step how
everything actually fits together.  I think it would be useful to add
a clock binding section, especially with how important it is shaping
up to be for the ARM SoC work we're doing.

g.
