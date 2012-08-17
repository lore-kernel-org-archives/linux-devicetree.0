From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: Associating devices with multiple parents
Date: Fri, 17 Aug 2012 11:37:22 +0100
Message-ID: <20120817103722.GA32216@opensource.wolfsonmicro.com>
References: <502D4B28.4020108@wwwdotorg.org> <502D6A3A.7060808@firmworks.com>
 <CACxGe6uqWG7kRUL0o3qPCMDvG52UyqTMez+AT1yK55X-xgaRuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6uqWG7kRUL0o3qPCMDvG52UyqTMez+AT1yK55X-xgaRuQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 16, 2012 at 04:20:47PM -0600, Grant Likely wrote:
> On Aug 16, 2012 3:46 PM, "Mitch Bradley" <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrote:

> > Is there an established Linux convention for expressing that dual-parent
> > relationship for I2C?  The phandle schemes for cross-tree gpio, clk, and
> > interrupt relationships obviously bear some resemblance to the problem,
> > but I haven't seen anything for I2C.

> Yes. Place the codec under the i2c controller and use a tope level audio
> complex node with phandles to both the codec and i2s nodes.

The nVidia bindings are probably the best ones to look at as an example
here.
