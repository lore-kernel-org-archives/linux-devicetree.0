From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 10/12] video: Add ADV751[13] DT bindings documentation
Date: Thu, 25 Sep 2014 12:57:13 +0300
Message-ID: <7167797.cQ2LzKYS7F@avalon>
References: <1411589072-28609-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1411589072-28609-11-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdVT8AC+HeYJBSUn149D-CgcVHEiUsWYx_e--kbK06awkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAMuHMdVT8AC+HeYJBSUn149D-CgcVHEiUsWYx_e--kbK06awkw@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, DRI Development <dri-devel@lists.freedesktop.org>, Linux-sh list <linux-sh@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On Thursday 25 September 2014 09:06:46 Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> On Wed, Sep 24, 2014 at 10:04 PM, Laurent Pinchart
> 
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > +- adi,input-style: The input components arrangement variant (1, 2 or 3).
> 
> What's the meaning of the numerical values 1, 2, and 3?
> 
> I found this code in "[PATCH 11/12] drm: Add adv7511 encoder driver":
> 
> +       input_style = config->input_style == 1 ? 2
> +                   : (config->input_style == 2 ? 1 : 3);
> 
> which didn't really help much ;-)

:-)

The ADV751[13]W? datasheets document all the supported input formats. They're 
split in categories, each of them having multiple variants called styles. The 
styles are just numbered 1, 2 and 3 in the tables that describe the formats, 
and there's a register field used to select a style. For some reason style 1 
maps to register value 2, style 2 to register value 1, and style 3 to register 
value 3. Go figure...

-- 
Regards,

Laurent Pinchart
