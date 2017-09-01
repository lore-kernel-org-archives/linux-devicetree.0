From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: [PATCH] Aesthetic/grammar fixes to first part of devicetree-basics.rst
 0.1 spec
Date: Fri, 1 Sep 2017 01:19:57 -0400 (EDT)
Message-ID: <alpine.LFD.2.21.1709010114230.20835@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-725556867-1504243199=:20835"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-725556867-1504243199=:20835
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


Various grammar/font/spacing tweaks to first part of
devicetree-basics.rst, including:

 * rendering node names in monospaced font
 * italicizing some terms
 * proper capitalization of some terms

Signed-off-by: Robert P. J. Day <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>

---

  have not processed the new source file so i can't verify i didn't
mess something up, but all these changes look pretty innocuous; more
to come a chunk at a time.

diff --git a/source/devicetree-basics.rst b/source/devicetree-basics.rst
index 02696ba..5874ec3 100644
--- a/source/devicetree-basics.rst
+++ b/source/devicetree-basics.rst
@@ -15,9 +15,9 @@ program’s memory and passes a pointer to the devicetree to the client.
 This chapter describes the logical structure of the devicetree and
 specifies a base set of properties for use in describing device nodes.
 Chapter :ref:`chapter-device-node-requirements` specifies certain device nodes
-required by a |spec| compliant
-devicetree. Chapter 6 describes the |spec| defined device bindings— the
-requirements for representing certain device types classes of devices.
+required by a |spec|-compliant
+devicetree. Chapter 6 describes the |spec|-defined device bindings—the
+requirements for representing certain device types or classes of devices.
 Chapter 8 describes the in-memory encoding of the devicetree.

 A devicetree is a tree data structure with nodes that describe the
@@ -25,7 +25,7 @@ devices in a system. Each node has property/value pairs that describe
 the characteristics of the device being represented. Each node has
 exactly one parent except for the root node, which has no parent.

-An |spec|-compliant devicetree describes device information in a system
+A |spec|-compliant devicetree describes device information in a system
 that cannot necessarily be dynamically detected by a client program. For
 example, the architecture of PCI enables a client to probe and detect
 attached devices, and thus devicetree nodes describing PCI devices
@@ -38,8 +38,8 @@ probing.
 :numref:`example-simple-devicetree` shows an example representation of a
 simple devicetree that is nearly
 complete enough to boot a simple operating system, with the platform
-type, CPU, and memory described. Device nodes are shown with properties
-and values shown beside the node.
+type, CPU, memory and a single UART described. Device nodes are shown
+with properties and values inside each node.

 .. _example-simple-devicetree:
 .. digraph:: tree
@@ -60,8 +60,8 @@ and values shown beside the node.
    #size-cells=\<0\>\l"]

    "cpu@0" [ label="\N |
-   reg=\<0\>\l
    device_type=\"cpu\"\l
+   reg=\<0\>\l
    timebase-frequency=\<825000000\>\l
    clock-frequency=\<825000000\>\l"]

@@ -165,10 +165,10 @@ identified by a forward slash (/).

 In :numref:`example-nodenames`:

-* The nodes with the name cpu are distinguished by their unit-address
+* The nodes with the name ``cpu`` are distinguished by their unit-address
   values of 0 and 1.
-* The nodes with the name Ethernet are distinguished by their
-  unit-address values of FE002000 and FE003000.
+* The nodes with the name ``ethernet`` are distinguished by their
+  unit-address values of ``fe002000`` and ``fe003000``.

 Generic Names Recommendation
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -435,7 +435,7 @@ properties are described in detail in this section. Device nodes defined
 by |spec| (see Chapter :ref:`chapter-device-node-requirements`) may specify
 additional requirements or constraints regarding the use of the standard
 properties. Chapter :ref:`chapter-device-bindings` describes the representation
-of specific devices may also specify additional requirements.
+of specific devices and may also specify additional requirements.

 .. note:: All examples of devicetree nodes in this document use the
    :abbr:`DTS (Devicetree Source)` format for specifying nodes and properties.
@@ -467,10 +467,10 @@ Description:

 Example:

-   ``compatible = "fsl,mpc8641-uart", "ns16550";``
+   ``compatible = "fsl,ns16550", "ns16550";``

    In this example, an operating system would first try to locate a device
-   driver that supported fsl,mpc8641-uart. If a driver was not found, it
+   driver that supported fsl,ns16550. If a driver was not found, it
    would then try to locate a driver that supported the more general
    ns16550 device type.

@@ -560,7 +560,7 @@ Description:
    ============== ==============================================================
    Value          Description
    ============== ==============================================================
-   ``"okay"``     Indicates the device is operational
+   ``"okay"``     Indicates the device is operational.
    -------------- --------------------------------------------------------------
    ``"disabled"`` Indicates that the device is not presently operational, but it
                   might become operational in the future (for example, something
@@ -575,7 +575,7 @@ Description:
    -------------- --------------------------------------------------------------
    ``"fail-sss"`` Indicates that the device is not operational. A serious error
                   was detected in the device and it is unlikely to become
-                  operational without repair. The sss portion of the value is
+                  operational without repair. The *sss* portion of the value is
                   specific to the device and indicates the error condition
                   detected.
    ============== ==============================================================
@@ -600,7 +600,7 @@ Description:
    The *#address-cells* and *#size-cells* properties are not inherited from
    ancestors in the devicetree. They shall be explicitly defined.

-   An |spec|-compliant boot program shall supply *#address-cells* and
+   A |spec|-compliant boot program shall supply *#address-cells* and
    *#size-cells* on all nodes that have children.

    If missing, a client program should assume a default value of 2 for
@@ -625,13 +625,13 @@ Example:
          };
       };

-   In this example, the *#address-cells* and *#size-cells* properties of the soc node
+   In this example, the *#address-cells* and *#size-cells* properties of the ``soc`` node
    are both set to 1. This setting specifies that one cell is required to
    represent an address and one cell is required to represent the size of
    nodes that are children of this node.

    The serial device *reg* property necessarily follows this specification
-   set in the parent (soc) node—the address is represented by a single cell
+   set in the parent (``soc``) node—the address is represented by a single cell
    (0x4600), and the size is represented by a single cell (0x100).

 reg
@@ -647,7 +647,7 @@ Description:
    within the address space defined by its parent bus. Most commonly this
    means the offsets and lengths of memory-mapped IO register blocks, but
    may have a different meaning on some bus types. Addresses in the address
-   space defined by root node are cpu real addresses.
+   space defined by the root node are CPU real addresses.

    The value is a *<prop-encoded-array>*, composed of an arbitrary number
    of pairs of address and length, *<address length>*. The number of
@@ -738,7 +738,7 @@ Address Translation Example:
              reg = <0x4600 0x100>;
              clock-frequency = <0>;
              interrupts = <0xA 0x8>;
-             interrupt-parent = < &ipic >;
+             interrupt-parent = <&ipic>;
           };
        };

@@ -800,7 +800,7 @@ Description:
    The *name* property is a string specifying the name of the node. This
    property is deprecated, and its use is not recommended. However, it
    might be used in older non-|spec|-compliant devicetrees. Operating
-   system should determine a node’s name based on the *name* component of
+   system should determine a node’s name based on the *node-name* component of
    the node name (see section :ref:`sect-node-names`).

 device_type (deprecated)
@@ -814,8 +814,8 @@ Description:

    The *device\_type* property was used in IEEE 1275 to describe the
    device’s FCode programming model. Because |spec| does not have FCode, new
-   use of the property is deprecated, and it should be included only on cpu
-   and memory nodes for compatibility with IEEE 1275–derived devicetrees.
+   use of the property is deprecated, and it should be included only on ``cpu``
+   and ``memory`` nodes for compatibility with IEEE 1275–derived devicetrees.

 .. _sect-interrupts:


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
--8323328-725556867-1504243199=:20835--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
