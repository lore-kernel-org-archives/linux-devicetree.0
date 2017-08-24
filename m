From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] checks: add phandle with arg property checks
Date: Thu, 24 Aug 2017 14:19:27 -0500
Message-ID: <CAL_Jsq+NVBF6npai2_CRSVchGN_EQBSYnQcw3rHZcNFKpP7pDg@mail.gmail.com>
References: <20170822230208.20987-1-robh@kernel.org> <20170822230208.20987-2-robh@kernel.org>
 <20170824020338.GV5379@umbus.fritz.box> <CAL_Jsq+0Njjs_PHBSD-B7W9YFzdfpB2ApBcBD=48+BoXQKv2pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+0Njjs_PHBSD-B7W9YFzdfpB2ApBcBD=48+BoXQKv2pw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 24, 2017 at 12:23 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Aug 23, 2017 at 9:03 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> On Tue, Aug 22, 2017 at 06:02:06PM -0500, Rob Herring wrote:
>>> Many common bindings follow the same pattern of client properties
>>> containing a phandle and N arg cells where N is defined in the provider
>>> with a '#<specifier>-cells' property such as:

[...]

>>> +             if (prop->val.len < ((cell + cellsize + 1) * sizeof(cell_t))) {
>>> +                     FAIL(c, dti, "%s property size (%d) too small for cell size %d in %s",
>>> +                          prop->name, prop->val.len, cellsize, node->fullpath);
>>> +             }
>>
>> How will this cope if the property is really badly formed - e.g. a 3
>> byte property, so you can't even grab a whole first phandle?  I think
>> it will trip the assert() in propval_cell_n() which isn't great.
>
> At least for your example, we'd exit the loop (cell < 3/4). But I need
> to a check for that because it would be silent currently. I'll add a
> check that the size is a multiple of 4 and greater than 0.
>
> However, the check here is not perfect because we could have
> "<&phandle1 1 2>" when really it should be "<&phandle1 &phandle2
> &phandle3>". We don't fail until we're checking the 2nd phandle.
> That's why I added the "or bad phandle" and the cell # in the message
> above. In the opposite case, we'd be silent. One thing that could be
> done is double check things against the markers if they are present.

Here's what that looks like:

/* If we have markers, verify the current cell is a phandle */
if (prop->val.markers) {
  struct marker *m = prop->val.markers;
  for_each_marker_of_type(m, REF_PHANDLE) {
    if (m->offset == (cell * sizeof(cell_t)))
      break;
  }
  if (!m)
  FAIL(c, dti, "Property '%s', cell %d is not a valid phandle in %s",
    prop->name, cell, node->fullpath);
}
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
