From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: some questions [gpio]
Date: Wed, 9 Sep 2009 11:10:27 -0600
Message-ID: <fa686aa40909091010x10e406e2ia7a19c54865e0853@mail.gmail.com>
References: <20090909155053.7b79f4d3@vitb-lp>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20090909155053.7b79f4d3@vitb-lp>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Vitaly Bordug <vitb-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

(Added devicetree and linuxppc-dev to cc: list)

On Wed, Sep 9, 2009 at 5:50 AM, Vitaly Bordug<vitb-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> Hi Grant,
>
> Remember I was asking some time ago about multiple gpio chips per
> device node to enable sint gpio on 52xx?
>
> I need an advice again: adding multiple chips is OK but it stores
> address of the of_gpio_chip or smth like that in device_node->data.
> And that is used in routine that grabs all data from gpios<>. Hereby
> to implement multiple chips, I'd need to store in device_node ->data
> ponter to the array of gpio_chips, and to store actual amount of those
> chips somewhere, + study of_get_gpio_flags() to traverse several
> gpio_chips. That way, gpio_cells would be 3. Seems a little overkill...

Hmmm.  Refactoring the existing binding in non-backwards compatible
ways is not okay.  gpio_cells cannot be changed from 2 to 3 without
breaking existing users.

> Maybe it would be better to split away gpio_sint stuff?

I don't like it much since it kind of is one block of registers.
However, a binding change must be made regardless because the current
binding has no method of describing the sint pins (or the output-only
pins for that matter).  That leaves 2 options that I see:

1) Add a new node for the sint register range in the GPIO standard
registers block.
2) add some kind of offset to the 1st cell in the gpio property.  (ie.
0-0x20 for simple GPIOs, 0x200-0x207 for interrupt gpios, and
0x100-0x107 for output only gpios)

I'll ignore which approach is easier to implement currently in Linux
and try to focus on what the best binding would be.  Option 2 looks
pretty ugly and non-intuitive to me.  The only advantage there is it
keeps things described as a single block in the mpc5200 user manual
all in one node.  However, I think the clarity of option 1 wins out,
especially considering that there isn't currently any code that tries
to describe the sint pins in the device tree, so it has a smaller
likelyhood of causing breakage.

... so it would seem that my opinion on this matter is now the exact
opposite from the last time I talked to you now that I've actually
looked at the binding.  :-)

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
