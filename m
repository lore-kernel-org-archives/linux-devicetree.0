From: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] of: support an enumerated-bus compatible value
Date: Tue, 3 Jul 2012 17:43:05 +0200
Message-ID: <DF4AD962-D8A8-43AA-AF14-5DBF65505EDF@kernel.crashing.org>
References: <4FF1C567.4060809@wwwdotorg.org> <4FF1D8F9.9040005@firmworks.com>
 <4FF1DDBD.9050106@wwwdotorg.org> <4FF1EA1A.9030307@firmworks.com>
 <4FF1F955.6030204@wwwdotorg.org>
 <6BC22F77-77D7-45DF-821A-6CA2DBADEA59@kernel.crashing.org>
 <4FF22031.3060206@wwwdotorg.org>
 <FE3C6687-727E-4191-9D37-9E71EBFEF0AE@kernel.crashing.org>
 <20120703104720.GB25995@sirena.org.uk>
 <F928AF0B-65CF-48D1-8DB5-4C27FD6AB82F@kernel.crashing.org>
 <20120703144242.GE25995@sirena.org.uk>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120703144242.GE25995-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
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
To: Mark Brown <broonie-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

>> There is still no reason for the fake bus node to have a "compatible"
>> property though.  What could it possibly mean?  "This bus does not
>> exist at all but you access it in bla bla bla way"?  That just  
>> doesn't
>> make sense.  It doesn't exist, you do not access it, it has no
>> programming model, it has no "compatible" property.
>
> Well, as everyone keeps saying this seems to be a limitation of the
> current device tree rather than something that's actually sensible in
> and of itself.

But that is my point: it is *not* a limitation of the device tree,
the device tree can describe the hardware just fine without doing
some weird "compatible" property.  The limitation is in the current
Linux kernel code; _it_ should be fixed, don't add decorations to
the device tree to work around shortcomings in a single OS.  The
device tree describes the structure of the hardware, not the structure
of the device model in the OS.


Segher
