From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: DT case sensitivity
Date: Fri, 24 Aug 2018 07:49:19 +1000
Message-ID: <4557653efa685ffc0533f7168a628491ad843e01.camel@kernel.crashing.org>
References: <CAL_Jsq+XacT2O15CQ=F_6dmWf6OqNf8_fKAOrMJNR79a6mORaw@mail.gmail.com>
 <3335cff2cc999c1dda58d75949ab3d12185fca79.camel@kernel.crashing.org>
 <20180823121929.GS24439@gate.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20180823121929.GS24439@gate.crashing.org>
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
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Rob Herring <robh@kernel.org>, Kumar Gala <kumar.gala@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, devicetree-spec@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, devicetree@vger.kernel.org, Grant Likely <grant.likely@arm.com>, Frank Rowand <frowand.list@gmail.com>, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

On Thu, 2018-08-23 at 07:19 -0500, Segher Boessenkool wrote:
> If one implementation does case insensitive, it will most likely just work,
> because people do not make insane names differing only in case on purpose.

Apple did :-)

ide, vs IDE, ata vs ATA, I've seen all sort of crap there, esp. on old
machines.

> Now people write other things that they only test against that implementation,
> and those things now only work with case-insensitive.  And you do not know
> without testing if anything breaks.  (But the laws of big numbers are against
> you here).  Since there isn't really a drawback to doing case-insensitive
> always, that is a much safer way forward, much less work for everyone, even
> if technically the wrong thing to do :-)
> 
> 
> Segher
