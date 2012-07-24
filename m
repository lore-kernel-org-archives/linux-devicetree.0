From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] of: support an enumerated-bus compatible value
Date: Tue, 24 Jul 2012 13:30:13 -0600
Message-ID: <500EF7C5.6060406@wwwdotorg.org>
References: <4FF1C567.4060809@wwwdotorg.org> <4FF34EC2.6040908@wwwdotorg.org>
 <500EDD8A.2010701@wwwdotorg.org> <201207241848.53308.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201207241848.53308.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/24/2012 12:48 PM, Arnd Bergmann wrote:
> On Tuesday 24 July 2012, Stephen Warren wrote:
>>
>> That makes the child nodes' reg property slightly more complex since I
>> don't get to elide the size cell, but does mean that we don't have to
>> change anything (code or bindings) at all to make it work. I guess the
>> lack of any ranges property within the top-level regulators node makes
>> it clear enough that the bus/child address space is not part of the
>> parent CPU's address space.
> 
> One would think that, but the of_address handling code actually treats
> empty ranges the same as missing ranges, in violation of the spec,
> and as a workaround to deal with some powermac machines that required
> this.
> 
> I'd rather fix the code to deal with this correctly.

OK, so what is correctly then?

Adding an explicit enumerated-bus compatible value/node-type/binding
seems like "correctly" to me, but it seemed like others didn't agree.
