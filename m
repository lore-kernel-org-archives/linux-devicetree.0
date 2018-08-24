From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: DT case sensitivity
Date: Fri, 24 Aug 2018 15:39:19 +1000
Message-ID: <87tvnkjpbs.fsf@concordia.ellerman.id.au>
References: <CAL_Jsq+XacT2O15CQ=F_6dmWf6OqNf8_fKAOrMJNR79a6mORaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <CAL_Jsq+XacT2O15CQ=F_6dmWf6OqNf8_fKAOrMJNR79a6mORaw@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Rob Herring <robh@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Grant Likely <grant.likely@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Kumar Gala <kumar.gala@linaro.org>, David Gibson <david@gibson.dropbear.id.au>, Frank Rowand <frowand.list@gmail.com>, devicetree-spec@vger.kernel.org, devicetree@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Rob Herring <robh@kernel.org> writes:

> The default DT string handling in the kernel is node names and
> compatibles are case insensitive and property names are case sensitive
> (Sparc is the the only variation and is opposite). It seems only PPC
> (and perhaps only Power Macs?) needs to support case insensitive
> comparisons. It was probably a mistake to follow PPC for new arches
> and we should have made everything case sensitive from the start. So I
> have a few questions for the DT historians. :)
>
> What PPC systems are case insensitive? Can we limit that to certain systems?
>
> AFAICT, dtc at least (if not anything FDT based) has always been case
> sensitive at least for node and property names. I'm not sure about
> compatible strings?
>
> Anyone see potential issues with switching all platforms except PPC
> and Sparc to case sensitive comparisons?

Looking at some old device trees, on ppc we do definitely have mixed
case compatible strings, and I see a few hundred of those appear in the
kernel source. So I think for us it's too late.

But I don't see why that prevents other arches from switching to case
sensitive, I don't think it really hurts us in any way.

cheers
