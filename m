From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 08/10] pinctrl: single: support pinconf generic
Date: Fri, 19 Oct 2012 11:53:48 -0700
Message-ID: <20121019185348.GS4730@atomide.com>
References: <1350551224-12857-1-git-send-email-haojian.zhuang@gmail.com>
 <1350551224-12857-8-git-send-email-haojian.zhuang@gmail.com>
 <CACRpkda0QLkdKns3CXNOijYBjaDtW1QyhNYjTqDvRH-in8pvZQ@mail.gmail.com>
 <20121018222907.GH30550@atomide.com>
 <CAN1soZzsruhWt7VFgf5Fi79npcjLiMSUEVwnE3hR5iWEh+9GRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAN1soZzsruhWt7VFgf5Fi79npcjLiMSUEVwnE3hR5iWEh+9GRw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [121018 19:25]:
> 
> I wonder whether gpio function in OMAP is also configured in the pinmux
> register. For example, the function is 3bit field in pinmux register
> of Marvell's
> PXA/MMP silicon. GPIO function is the one of function.

For omaps, the mux registers in padconf area just control
the routing of the signal, pulls and wake-up events. So
gpio mode is a number in the mode bits [2:0]. It's mode 3
for some omaps and mode 4 for some omaps. All the other GPIO
related registers are elsewhere.

Sounds like this is different from what you are describing,
but if you want to compare it, the register bits in the
legacy mach-omap2/mux.h are:

/* 34xx mux mode options for each pin. See TRM for options */
#define OMAP_MUX_MODE0      0
#define OMAP_MUX_MODE1      1
#define OMAP_MUX_MODE2      2
#define OMAP_MUX_MODE3      3
#define OMAP_MUX_MODE4      4
#define OMAP_MUX_MODE5      5
#define OMAP_MUX_MODE6      6
#define OMAP_MUX_MODE7      7
               
/* 24xx/34xx mux bit defines */
#define OMAP_PULL_ENA                   (1 << 3)
#define OMAP_PULL_UP                    (1 << 4)
#define OMAP_ALTELECTRICALSEL           (1 << 5)
               
/* 34xx specific mux bit defines */
#define OMAP_INPUT_EN                   (1 << 8)
#define OMAP_OFF_EN                     (1 << 9)
#define OMAP_OFFOUT_EN                  (1 << 10)
#define OMAP_OFFOUT_VAL                 (1 << 11)
#define OMAP_OFF_PULL_EN                (1 << 12)
#define OMAP_OFF_PULL_UP                (1 << 13)
#define OMAP_WAKEUP_EN                  (1 << 14)
       
/* 44xx specific mux bit defines */
#define OMAP_WAKEUP_EVENT               (1 << 15)

Regards,

Tony
