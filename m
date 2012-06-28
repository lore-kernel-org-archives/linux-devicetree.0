From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: #size-cells = <0> in a bus node, and kernel messages complaining
 about this
Date: Thu, 28 Jun 2012 12:22:23 -1000
Message-ID: <4FECD91F.7000302@firmworks.com>
References: <4FEB7A8E.1090409@wwwdotorg.org> <4FEBABE0.2050503@firmworks.com>
 <4FEC994A.4030507@wwwdotorg.org> <4FECA092.60307@firmworks.com>
 <4FECA72F.9080601@firmworks.com> <4FECBE5B.1090300@firmworks.com>
 <4FECC3D5.2030507@wwwdotorg.org> <4FECC569.1000108@firmworks.com>
 <4FECD461.9030802@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FECD461.9030802-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 6/28/2012 12:02 PM, Stephen Warren wrote:
> On 06/28/2012 02:58 PM, Mitch Bradley wrote:
>> On 6/28/2012 10:51 AM, Stephen Warren wrote:
>>> On 06/28/2012 02:28 PM, Mitch Bradley wrote:
> ...
>>>> Hmmm....

>
> Ah yes.
>
> I'd somewhat prefer to avoid calling of_translate_address() when we
> know it's going to fail though, by passing a parameter to
> of_device_make_bus_id() indicating whether to use that or
> of_get_address(). The parameter would be set based on enumerated-bus vs.
> any other bus type. I coded that locally and it seems to work OK. That
> way, the diagnostic in of_translate_address() can be left unchanged; it
> seems like it really is an error.

Win.

> ...

>>> Do we need to include the full DT path to an enumerated device, or some
>>> other unique data for the node's bus, in the device name of a child of
>>> an enumerated bus?
>>
>> I don't know.  Is the device name space flat?
>
> Hmmm. It depends on where you look.
>
> I end up with /sys/devices/regulators.3/[01].regulator/ this way, the
> path structure of which is defined by the parent/child device
> relationship, and implies that device names are relative to their parent.
>
> However, device names are treated as a flat namespace in many other
> places. For example, clocks, regulators, pinctrl settings, etc. are
> looked up by device name, and the names in the lookup tables are just
> the device name itself, with no reference to the device's parent.

The world in general seems to manage just fine with namespaces that are 
sometimes fully-qualified but more often at least partially ambiguous. 
Personally, I find that scrupulous avoidance of ambiguity - with dotted 
namespaces or hashes - ends up being hard for humans (or at least this 
human) to deal with.  So maybe it's okay if we don't fully address this 
problem.
