From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] of: support an enumerated-bus compatible value
Date: Mon, 02 Jul 2012 16:28:37 -0600
Message-ID: <4FF22095.4030106@wwwdotorg.org>
References: <1340924755-31447-1-git-send-email-swarren@wwwdotorg.org>
 <4FF0A6B6.8040902@gmail.com> <4FF1C567.4060809@wwwdotorg.org>
 <CACxGe6ty5wU6Y+fuFYfBsM4HRLZaTff9EnzCP2FzmcQGOyJ=xQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6ty5wU6Y+fuFYfBsM4HRLZaTff9EnzCP2FzmcQGOyJ=xQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/02/2012 03:43 PM, Grant Likely wrote:
> On Mon, Jul 2, 2012 at 9:59 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 07/01/2012 04:03 PM, Grant Likely wrote:
>> ...
>>> Besides; if they are enumerated, non-memory mapped devices, then is it
>>> really appropriate to use platform_{device,driver}? I don't think it
>>> is.
>>
>> Hmm, well /everything/ that gets instantiated from DT is a platform
>> device at present, at least for the platforms and bus types we're using
>> on Tegra and I believe all/most ARM platforms, except some small amounts
>> of AMBA.
> 
> Not true.  SPI devices beget spi_device, i2c devices i2c_client, etc.
> The appropriate structure for the kind of device should always be
> used.

Yes, that's true.

But doesn't that lend even more weight to the need for an enumerated-bus
bus-type/compatible value? After all, the more important issue here (at
least initially) is the DT representation that we're defining, rather
than what Linux does with it internally.
