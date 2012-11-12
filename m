From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] dt: platform: Extract device name from device tree blob
Date: Mon, 12 Nov 2012 15:20:00 +0000
Message-ID: <CACxGe6vjLA3j-bc_048UrdB5Q=8pV8=LPSVUnU_k3anX23vwyw@mail.gmail.com>
References: <1352732343-1199-1-git-send-email-per.forlin@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1352732343-1199-1-git-send-email-per.forlin-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
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
To: Per Forlin <per.forlin-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, fredrik.soderstedt-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 12, 2012 at 2:59 PM, Per Forlin <per.forlin-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org> wrote:
> Add support to extract device name from device tree blob.
> If the property "dev-name" is set in the DTS this name will
> be used when creating the device.
> The auxdata_lookup has precedence and will override
> the "dev-name" property.

Using a 'dev-name' property has the same problem that the 'cell-index'
properties have in that it is encoding part of the global namespace
local to the node and it becomes easy to create collisions. Instead of
this check to see if one of the properties in /aliases points to the
node and use that for the name.

g.
