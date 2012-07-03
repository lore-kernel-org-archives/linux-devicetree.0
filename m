From: Mark Brown <broonie-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Subject: Re: [PATCH] of: support an enumerated-bus compatible value
Date: Tue, 3 Jul 2012 11:47:20 +0100
Message-ID: <20120703104720.GB25995@sirena.org.uk>
References: <1340924755-31447-1-git-send-email-swarren@wwwdotorg.org>
 <4FF0A6B6.8040902@gmail.com> <4FF1C567.4060809@wwwdotorg.org>
 <4FF1D8F9.9040005@firmworks.com> <4FF1DDBD.9050106@wwwdotorg.org>
 <4FF1EA1A.9030307@firmworks.com> <4FF1F955.6030204@wwwdotorg.org>
 <6BC22F77-77D7-45DF-821A-6CA2DBADEA59@kernel.crashing.org>
 <4FF22031.3060206@wwwdotorg.org>
 <FE3C6687-727E-4191-9D37-9E71EBFEF0AE@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <FE3C6687-727E-4191-9D37-9E71EBFEF0AE-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
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
To: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 03, 2012 at 02:27:15AM +0200, Segher Boessenkool wrote:

> Why would you want to instantiate devices that you cannot address
> at all anyway?  The only driver that can know what to do with the
> device node is the driver for the device that has the phandle
> reference to it; it can instantiate it.

It's not a single device referencing it, it's multiple devices
referencing it, and we can do useful things even with no external
references at all.  The node itself is a real thing that we can point at
and control (using GPIOs or something similar).
